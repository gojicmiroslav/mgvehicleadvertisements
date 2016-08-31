class AddFeaturedImageToAdvertisements < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisements, :featured_image, :string
  end
end
