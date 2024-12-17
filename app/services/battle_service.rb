# app/services/simulate_battle_service.rb

class BattleService
  attr_reader :hero1, :hero2, :log

  def initialize(hero1, hero2)
    @hero1 = hero1
    @hero2 = hero2
    @log   = []
  end

  def call
    simulate_battle hero1.health, hero2.health, 1
  end

  private

  def simulate_battle(hero1_health, hero2_health, step)
    log_life(step, hero1_health, hero2_health)
    return determine_winner(hero1_health, hero2_health) if hero1_health <= 0 || hero2_health <= 0

    hero2_health -= calculate_damage(hero1, step)
    return determine_winner(hero1_health, hero2_health) if hero2_health <= 0

    hero1_health -= calculate_damage(hero2, step)
    simulate_battle(hero1_health, hero2_health, step + 1)
  end

  def determine_winner(hero1_health, hero2_health)
    if hero1_health > hero2_health
      { winner: hero1, loser: hero2, log: }
    else
      { winner: hero2, loser: hero1, log: }
    end
  end

  def calculate_damage(hero, step)
    attack = hero.attack_power

    log << "#{hero.name} attack for #{attack} damage."

    attack
  end

  def log_life(step, hero1_health, hero2_health)
    log << "Turn #{step}: #{hero1.name} #{hero1_health} - #{hero2.name} #{hero2_health}"
  end
end
