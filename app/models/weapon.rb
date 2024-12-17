# frozen_string_literal: true

class Weapon < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :health, presence: true
  validates :attack_power, presence: true
  validates :crit, presence: true
  validates :accuraty, presence: true

  has_many :heroes_weapons
  has_many :heroes, through: :heroes_weapons
end
