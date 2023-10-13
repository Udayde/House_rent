# frozen_string_literal: true

class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :type
      t.string :location
      t.integer :buying_price
      t.integer :rental_price

      t.timestamps
    end
  end
end
