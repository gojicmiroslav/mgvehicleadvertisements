class AddCategoryToAdvertisement < ActiveRecord::Migration[5.0]
  def change
  	add_reference :advertisements, :category, index: true
   	add_foreign_key :advertisements, :categories, on_delete: :cascade, on_update: :cascade
  end
end
