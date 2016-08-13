class CreateDrives < ActiveRecord::Migration[5.0]
  def change
    create_table :drives do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
