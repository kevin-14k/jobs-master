# frozen_string_literal: true

class BattleHistoriesController < ApplicationController
  def index
    @battle_histories = BattleHistory.order(date: :desc)
  end
end
