# frozen_string_literal: true

class AddBattleHistory < ActiveRecord::Migration[7.0]
  def change
    create_table :battle_histories do |t|
      t.references :hero1, null: false, foreign_key: { to_table: :heroes }
      t.references :hero2, null: false, foreign_key: { to_table: :heroes }
      t.references :winner, null: false, foreign_key: { to_table: :heroes }
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
