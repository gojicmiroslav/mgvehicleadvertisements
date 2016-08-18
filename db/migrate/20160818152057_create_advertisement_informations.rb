class CreateAdvertisementInformations < ActiveRecord::Migration[5.0]
  	def change
		create_table :advertisement_informations do |t|
			t.string :value
				t.references :advertisement, index: true
				t.references :information, index: true

			t.timestamps null: false
		end

		add_foreign_key :advertisement_informations, :advertisements
		add_foreign_key :advertisement_informations, :information
	end
end
