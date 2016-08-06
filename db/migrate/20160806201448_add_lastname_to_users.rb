class AddLastnameToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :lastname, :string, after: :firstname
  end
end
