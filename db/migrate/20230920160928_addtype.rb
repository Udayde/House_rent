# frozen_string_literal: true

class Addtype < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :type, :integer
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
