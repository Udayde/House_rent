# frozen_string_literal: true

class Addreference < ActiveRecord::Migration[7.0]
  def change
    add_reference :houses, :user, foreign_key: true
  end
end
