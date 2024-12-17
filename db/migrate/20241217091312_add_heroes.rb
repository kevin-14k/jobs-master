# frozen_string_literal: true

class AddHeroes < ActiveRecord::Migration[7.0]
  def change
    create_table :heroes do |t|
      t.string  :name, null: false
      t.integer :health, null: false, default: 100
      t.integer :attack_power, null: false, default: 20

      t.timestamps
    end
  end
end
