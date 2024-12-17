# frozen_string_literal: true

class BattleHistory < ApplicationRecord
  belongs_to :hero1,  class_name: 'Hero'
  belongs_to :hero2,  class_name: 'Hero'
  belongs_to :winner, class_name: 'Hero'

  validates :hero1, :hero2, :winner, :date, presence: true
end
