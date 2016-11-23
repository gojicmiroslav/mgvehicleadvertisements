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

	after_commit :send_email, if: :status_changed?

	# TODO - ovo refaktorisati
	def save_all advertisement_informations
		advertisement_informations ||= {}
	  	advertisement_informations.each do |info_id, value|
	  		a = AdvertisementInformation.create(
        			advertisement: self,
        			information: Information.find(info_id),
        			value: value
      			)
	  		self.advertisement_informations << a
	  	end

	  	self.pending!
		self.save
	end

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

    scope :title_like_term, -> (term) { where("title like ?", "%#{term}%") }

    def self.search(q, paginate)
    	q.gsub!(/[^a-zA-Z0-9\-]/," ") 
    	search = q.split
    	results = none

    	if search.size == 0 
    		results = all
    	elsif search.size == 1
    		results = Advertisement
					.left_outer_joins(:advertisement_informations)
					.where("title like ? OR value like ?", "%#{search.first}%", "%#{search.first}%")
					.distinct
        elsif search.size > 1
        	searchable_columns = [:title, :value]
        	
        	query = search.map do |term|
        	 	fields = searchable_columns.map do |column|
        	 		" #{column} LIKE #{sanitize("%#{term}%")}"
      			end
      			"#{fields.join(' OR ')}"
        	end.join(' OR ')

        	results = Advertisement
    				.left_outer_joins(:advertisement_informations)
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

