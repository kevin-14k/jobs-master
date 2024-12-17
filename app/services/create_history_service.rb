# app/services/create_history_service.rb

class CreateHistoryService
  attr_reader :hero1, :hero2, :winner

  def initialize(hero1, hero2, winner)
    @hero1  = hero1
    @hero2  = hero2
    @winner = winner
  end

  def call
    increment_xp
    update_metrics
    create_history
  end

  private

  def increment_xp
    winner.increment!(:xp)
  end

  def update_metrics
    winner.increment!(:wins)
    hero1.increment!(:battles)
    hero2.increment!(:battles)
  end

  def create_history
    ::BattleHistory.create(
      hero1: hero1,
      hero2: hero2,
      winner: winner,
      date: Time.current
    )
  end
end
