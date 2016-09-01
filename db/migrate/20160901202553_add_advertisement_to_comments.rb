class AddAdvertisementToComments < ActiveRecord::Migration[5.0]
  def change
  	add_reference :comments, :advertisement, index: true, foreign_key: true
  end
end
