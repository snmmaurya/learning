class Animal < ApplicationRecord
  scope :lions, -> {where(type: 'Lion')}
  scope :horses, -> {where(type: 'Horse')}

  def self.types
    ['Lion', 'Horse']
  end
end