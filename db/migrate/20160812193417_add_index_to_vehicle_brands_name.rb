class AddIndexToVehicleBrandsName < ActiveRecord::Migration[5.0]
  def change
  	add_index :vehicle_brands, :name, unique: true
  end
end
