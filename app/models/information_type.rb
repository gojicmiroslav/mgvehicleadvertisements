class InformationType < ActiveRecord::Base
	has_many :informations

	scope :get_by_name, -> (name) { where(name: name) if name.present? }

	def self.get_id_by_name(name)
		return if name.nil? or name.eql?("")

		get_id(name)
	end

	def self.get_id(name)
		info_type = get_by_name(name)
		return unless info_type.present?

		info_type.limit(1).pluck(:id).first
	end

end