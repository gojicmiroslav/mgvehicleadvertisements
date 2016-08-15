class AddFuelToAdvertisement < ActiveRecord::Migration[5.0]
  def change
  	add_reference :advertisements, :fuel, index: true
  	add_foreign_key :advertisements, :fuels, on_delete: :cascade, on_update: :cascade
  end
end
