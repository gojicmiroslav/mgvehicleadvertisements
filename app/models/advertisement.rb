class Advertisement < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]

	belongs_to :advertisement_type
	belongs_to :user, validate: true
	belongs_to :category, validate: true
	belongs_to :vehicle_model, validate: true
	has_and_belongs_to_many :options, autosave: true
	has_many :advertisement_informations, autosave: true, dependent: :destroy
	has_many :informations, through: :advertisement_informations
	has_many :comments

	# this creates advertisement_informations_attributes= method on Advertisement that allows
	# create, update and delete destroy advertisement_informations
	accepts_nested_attributes_for :advertisement_informations
	accepts_nested_attributes_for :options

	serialize :images, Array
	# picture - name of the attribute
	mount_uploaders :images, ImageUploader

	mount_uploader :featured_image, FeaturedImageUploader

	validates :title, presence: true
	validates :price, presence: true
	validates :year, presence: true
	validates :vehicle_model, presence: true
	validates :user, presence: true

	# active - 0, inactive - 1, pending - 2, rejected - 3
	enum status: [:active, :inactive, :pending, :rejected]

	scope :active, -> { where(status: self.statuses[:active]) }
  scope :title_like_term, -> (term) { where("title like ?", "%#{term}%") }
	after_commit :send_email, if: :status_changed?

  # Refactoring =====================================================================================
  def get_basic_advertisement_information
    basic_information_id = InformationType.get_id_by_name("Basic")
    return if basic_information_id.nil?

    basic_advertisement_informations = create_initial_information_array_for(basic_information_id)

    fill_initial_arr_for(basic_advertisement_informations)
  end

  def get_additional_advertisement_information
    additional_information_id = InformationType.get_id_by_name("Additional")
    return if additional_information_id.nil?

    additional_advertisement_informations = create_initial_information_array_for(additional_information_id)

    fill_initial_arr_for(additional_advertisement_informations)
  end

  def create_initial_information_array_for(id)
    information_arr = {}

    informations.each do |info|
      if info.information_type.id == id
        information_arr[info.name] = ""
      end
    end

    information_arr
  end

  def fill_initial_arr_for(information_arr)
    return if information_arr.nil? or information_arr.empty?

    advertisement_informations.each do |adv_info|
      if information_arr.has_key?(adv_info.information.name)
        information_arr[adv_info.information.name] = adv_info.value
      end     
    end

    information_arr
  end
  #=================================================================================================

	# TODO - ovo refaktorisati
	def save_all advertisement_informations
    set_advertisement_informations unless advertisement_informations.nil?

  	self.pending!
		self.save!
	end

  def set_advertisement_informations
    advertisement_informations.each do |info_id, value|
      a = new_advertisement_information(info_id, value)
      self.advertisement_informations << a
    end
  end

  def new_advertisement_information(info_id, value)
    return if info_id.nil? or value.nil? or value.eql?("")

    information = find_information(info_id)
    return if information.nil?

    AdvertisementInformation.new(
      advertisement: self,
      information: information,
      value: value
    )
  end

  def find_information(id)
    begin
      Information.find(id)
    rescue
      nil
    end
  end

  #=================================================================================================

	def update_all(advertisement_params, informations)
		self.advertisement_informations.each do |info|
			informations.each do |key, value|
				if key.to_i == info.information_id.to_i
					info.value = value
				end
			end
		end

		return self.update(advertisement_params)
	end

	def get_information type
		id = InformationType.find_by(name: type).id
		arr = []

		informations.each do |info|
			if info.information_type_id == id
  				arr << info
  			end
		end

		return arr
	end

	# filter out empty options
	def self.get_options params
		arr = params.to_a
		ret_val = []

		arr.each do |el|
			if el[1]["name"].count == 2 && el[1]["name"].include?("1")
				ret_val << el[1]["id"].to_i
			end
		end

		return ret_val
	end

	def slug_candidates
		[
       		:title,
       		[:title, :year],
       		[:title, :year, :price]
		]
    end

    def self.search(q, paginate)
    	q.gsub!(/[^a-zA-Z0-9\-]/," ") 
    	search = q.split
    	results = none

    	if search.size == 0 
    		results = all
    	elsif search.size == 1
    		results = Advertisement
					.left_outer_joins(:advertisement_informations)
					.joins(vehicle_model: :vehicle_brand)
					.select("advertisements.*, vehicle_models.name, vehicle_brands.name")
					.where("advertisements.title LIKE ? OR advertisement_informations.value LIKE ? OR vehicle_brands.name LIKE ? OR vehicle_models.name LIKE ?",
							 "%#{search.first}%", "%#{search.first}%", "%#{search.first}%", "%#{search.first}%")
					.distinct
        elsif search.size > 1
        	searchable_columns = ["advertisements.title", 
        						  "advertisement_informations.value", 
        						  "vehicle_brands.name"]
        	
        	query = search.map do |term|
        	 	fields = searchable_columns.map do |column|
        	 		" #{column} LIKE #{sanitize("%#{term}%")}"
      			end
        	end.join(' OR ')

        	results = Advertisement
    				.joins(:advertisement_informations)
    				.joins(vehicle_model: :vehicle_brand)
    				.select("advertisements.*, vehicle_models.name, vehicle_brands.name")
    				.where(query)
    				.distinct
    	else
    		results = all
    	end

    	results
    		.active
	    	.paginate(page: paginate, per_page: 9)
            .order('created_at DESC')	
    end

    def self.advanced_search(params, paginate)
    	params.select! {|key, value| !key.eql?("controller")}
    	params.select! {|key, value| !key.eql?("action")}
    	params.select! {|key, value| !key.eql?("utf8") }
    	#remove empty params
    	category = Category.find(params[:category])
    	params.select! {|key, value| !value.eql?("")}
    	params.select! {|key, value| !key.eql?("category")}
    	query = ""
    	fields = []
    	vehicle_brand_exits  = false
    	fuel_exists = false
    	engine_exists = false
    	drive_exists = false
    	air_condition_exists = false
    	transmission_exists = false
    	exterior_color_exists = false

    	params.each do |key, value|	
    		if key.eql?("min_price") 
    			fields << " price > #{value} "
    		end

			if key.eql?("max_price") 
    			fields << " price < #{value} "
    		end			    	

			if key.eql?("min_year") 
				date = Time.new(value.to_i - 1).year
    			fields << " year > '#{date}' "
    		end 

    		if key.eql?("max_year") 
				date = Time.new(value.to_i + 1).year
    			fields << " year < '#{date}' "
    		end  

    		if key.eql?("search_vehicle_model") 
    			fields << " vehicle_model_id = #{value} " 
    		end 

    		if key.eql?("search_vehicle_brand") 
    			vehicle_brand_exits = true
    			fields << " vehicle_brand_id = #{value} " 
    		end     			

			if key.eql?("fuel") 
    			fuel_exists = true
    			information_id = Information.find_by(name: "Fuel").id
    			information_value = Item.find(value).name
    			fields << " information_id = #{information_id} AND value LIKE '#{information_value}' " 
    		end    

    		if key.eql?("engine") 
    			engine_exists = true
    			information_id = Information.find_by(name: "Engine").id
    			information_value = Item.find(value).name
    			fields << " information_id = #{information_id} and value LIKE '#{information_value}' " 
    		end 

    		if key.eql?("drive") 
    			drive_exists = true
    			information_id = Information.find_by(name: "Drive").id
    			information_value = Item.find(value).name
    			fields << " information_id = #{information_id} and value LIKE '#{information_value}' " 
    		end

    		if key.eql?("air_condition") 
    			air_condition_exists = true
    			information_id = Information.find_by(name: "Air Condition").id
    			information_value = Item.find(value).name
    			fields << " information_id = #{information_id} and value LIKE '#{information_value}' " 
    		end   

    		if key.eql?("transmission") 
    			transmission_exists = true
    			information_id = Information.find_by(name: "Transmission").id
    			information_value = Item.find(value).name
    			fields << " information_id = #{information_id} and value LIKE '#{information_value}' " 
    		end 

    		if key.eql?("exterior_color") 
    			exterior_color_exists = true
    			information_id = Information.find_by(name: "Exterior Color").id
    			information_value = Item.find(value).name
    			fields << " information_id = #{information_id} and value LIKE '#{information_value}' " 
    		end     			    		
		end
		query = fields.join(" AND ")

		results = category.advertisements			

		if vehicle_brand_exits
			results = results.joins(vehicle_model: :vehicle_brand)
		end

		if(fuel_exists || engine_exists || drive_exists || air_condition_exists || transmission_exists || exterior_color_exists)
			results = results.joins(:advertisement_informations)
		end

		results = results.where(query)    	

    	results
    		.active
	    	.paginate(page: paginate, per_page: 9)
            .order('created_at DESC')
    end

    private

    def status_changed?
    	if !pending?
    		ret_val = previous_changes.has_key?("status")
    	end
    end

    def send_email
    	@advertisement = self
		UserMailer.advertisement_updated(user.email, self).deliver_now
    end

end

