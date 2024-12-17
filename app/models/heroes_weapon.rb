class HeroesWeapon < ApplicationRecord
  belongs_to :hero
  belongs_to :weapon
end