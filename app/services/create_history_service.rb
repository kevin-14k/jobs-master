# app/services/create_history_service.rb

class CreateHistoryService
  attr_reader :hero1, :hero2, :winner

  def initialize(hero1, hero2, winner)
    @hero1  = hero1
    @hero2  = hero2
    @winner = winner
  end

  def call
    ::BattleHistory.create(
      hero1:  hero1,
      hero2:  hero2,
      winner: winner,
      date:   Time.current
    )
  end
end
