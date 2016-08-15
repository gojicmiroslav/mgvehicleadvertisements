class CreateAirConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :air_conditions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
