class AddFirstnameToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :firstname, :string, after: :id
  end
end
