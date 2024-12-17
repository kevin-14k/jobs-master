# frozen_string_literal: true

class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :health, null: false, default: 0
      t.integer :attack_power, null: false, default: 0
      t.integer :crit, null: false, default: 0
      t.integer :accuraty, null: false, default: 0

      t.timestamps
    end
  end
end
