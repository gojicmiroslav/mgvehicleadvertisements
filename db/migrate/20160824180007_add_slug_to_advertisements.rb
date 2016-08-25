class AddSlugToAdvertisements < ActiveRecord::Migration[5.0]
  def change
  	add_column :advertisements, :slug, :string
    add_index :advertisements, :slug, unique: true
  end
end
