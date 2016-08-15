class AddAirConditionToAdvertisement < ActiveRecord::Migration[5.0]
  def change
  	add_reference :advertisements, :air_condition, index: true
   	add_foreign_key :advertisements, :air_conditions, on_delete: :cascade, on_update: :cascade
  end
end
