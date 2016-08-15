class AddVehicleModelToAdvertisement < ActiveRecord::Migration[5.0]
  def change
  	add_reference :advertisements, :vehicle_model, index: true
   	add_foreign_key :advertisements, :vehicle_models, on_delete: :cascade, on_update: :cascade
  end
end
