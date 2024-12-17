# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Hero.create([
  { name: "Zaphod",    health: 120, attack_power: 18 },
  { name: "Alfred",    health: 150, attack_power: 20 },
  { name: "Daria",     health: 100, attack_power: 15 },
  { name: "Miyamoto",  health: 130, attack_power: 22 },
  { name: "Rorschach", health: 110, attack_power: 25 },
  { name: "Morpheus",  health: 140, attack_power: 28 },
  { name: "Juno",      health: 100, attack_power: 18 },
  { name: "Elara",     health: 120, attack_power: 16 }
])

