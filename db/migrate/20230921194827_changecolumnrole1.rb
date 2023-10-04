class Changecolumnrole1 < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :integer, default: 0
    # Ex:- :default =>''
    # Ex:- :default =>''
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
