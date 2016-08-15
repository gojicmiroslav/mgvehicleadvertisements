class AddEngineToAdvertisement < ActiveRecord::Migration[5.0]
  def change
  	add_reference :advertisements, :engine, index: true
   	add_foreign_key :advertisements, :engines, on_delete: :cascade, on_update: :cascade
  end
end
