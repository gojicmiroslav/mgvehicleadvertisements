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
