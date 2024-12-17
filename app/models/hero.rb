# frozen_string_literal: true

class Hero < ApplicationRecord
  self.table_name = 'heroes'

  validates :name, presence: true, uniqueness: true
  validates :health, presence: true, numericality: { greater_than: 0 }
  validates :attack_power, presence: true, numericality: { greater_than: 0 }
  validates :crit, presence: true, numericality: { greater_than: 0 }
  validates :accuraty, presence: true, numericality: { greater_than: 0 }

  has_one_attached :image
  validate :acceptable_image

  has_many :heroes_weapons
  has_many :weapons, through: :heroes_weapons

  def acceptable_image
    return unless image.attached?

    errors.add(:image, 'is too big') unless image.blob.byte_size <= 10.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:image, 'must be a JPEG or PNG') unless acceptable_types.include?(image.content_type)
  end
end
