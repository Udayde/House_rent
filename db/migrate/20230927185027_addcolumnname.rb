# frozen_string_literal: true

class Addcolumnname < ActiveRecord::Migration[7.0]
  def change
    add_column :feeds, :name, :string
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
