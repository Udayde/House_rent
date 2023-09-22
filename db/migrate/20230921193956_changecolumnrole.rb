class Changecolumnrole < ActiveRecord::Migration[7.0]
  def change
    remove_column :houses, :role
  end
end
