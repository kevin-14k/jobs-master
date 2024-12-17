# frozen_string_literal: true

class AddBattleMetricsToHero < ActiveRecord::Migration[7.0]
  def change
    add_column :heroes, :battles, :integer, null: false, default: 0
    add_column :heroes, :wins, :integer, null: false, default: 0
  end
end
