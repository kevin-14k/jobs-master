# frozen_string_literal: true

class AddFieldsToHeroes < ActiveRecord::Migration[7.0]
  def change
    add_column :heroes, :crit, :integer, null: false, default: 25
    add_column :heroes, :accuraty, :integer, null: false, default: 80
    add_column :heroes, :xp, :integer, null: false, default: 0
  end
end
