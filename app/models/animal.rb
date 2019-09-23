class Animal < ApplicationRecord
  scope :lions, -> {where(type: 'Lion')}
  scope :horses, -> {where(type: 'Horse')}

  validates :name, presence: true

  def self.types
    ['Lion', 'Horse']
  end
end