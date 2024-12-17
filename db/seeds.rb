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

Hero.find_by(name: 'Zaphod').image.attach(io: File.open(Rails.root.join('public', 'images', 'heroes', 'zaphod.png')), filename: 'zaphod.png')
Hero.find_by(name: 'Alfred').image.attach(io: File.open(Rails.root.join('public', 'images', 'heroes', 'alfred.png')), filename: 'alfred.png')
Hero.find_by(name: 'Daria').image.attach(io: File.open(Rails.root.join('public', 'images', 'heroes', 'daria.png')), filename: 'daria.png')
Hero.find_by(name: 'Miyamoto').image.attach(io: File.open(Rails.root.join('public', 'images', 'heroes', 'miyamoto.png')), filename: 'miyamoto.png')
Hero.find_by(name: 'Rorschach').image.attach(io: File.open(Rails.root.join('public', 'images', 'heroes', 'rorschach.png')), filename: 'rorschach.png')
Hero.find_by(name: 'Morpheus').image.attach(io: File.open(Rails.root.join('public', 'images', 'heroes', 'morpheus.png')), filename: 'morpheus.png')
Hero.find_by(name: 'Juno').image.attach(io: File.open(Rails.root.join('public', 'images', 'heroes', 'juno.png')), filename: 'juno.png')
Hero.find_by(name: 'Elara').image.attach(io: File.open(Rails.root.join('public', 'images', 'heroes', 'elara.png')), filename: 'elara.png')

Weapon.create([
    { name: "Long Sword", attack_power: 10 },
    { name: "Ruby Crystal", health: 20 },
    { name: "Zeal", crit: 10 },
    { name: "Dagger", accuraty: 15 }
  ]
)
