class Renamecolmn < ActiveRecord::Migration[7.0]
  def change
    rename_column :houses, :type, :available_for
    # Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
