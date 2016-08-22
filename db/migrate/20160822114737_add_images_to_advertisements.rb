class AddImagesToAdvertisements < ActiveRecord::Migration[5.0]
  def change
  	add_column :advertisements, :images, :text, array: true
  end
end
