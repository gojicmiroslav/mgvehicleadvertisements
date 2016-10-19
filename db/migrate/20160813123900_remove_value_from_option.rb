class RemoveValueFromOption < ActiveRecord::Migration[5.0]
  def change
  	remove_column :options, :value
  end
end
