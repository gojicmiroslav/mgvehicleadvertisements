class AddStyleToAdvertisement < ActiveRecord::Migration[5.0]
  def change
  	add_reference :advertisements, :style, index: true
   	add_foreign_key :advertisements, :styles, on_delete: :cascade, on_update: :cascade
  end
end
