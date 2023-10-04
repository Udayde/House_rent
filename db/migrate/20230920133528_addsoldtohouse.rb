class Addsoldtohouse < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :sold, :boolean, default: false
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
