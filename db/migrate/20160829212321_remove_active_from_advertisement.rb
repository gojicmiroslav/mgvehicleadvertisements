class RemoveActiveFromAdvertisement < ActiveRecord::Migration[5.0]
  def change
  	remove_column :advertisements, :active
  end
end
