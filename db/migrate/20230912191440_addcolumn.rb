class Addcolumn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string, default: 'user'
    # Ex:- :default =>''
  end
end
