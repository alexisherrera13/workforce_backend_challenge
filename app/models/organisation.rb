class Organisation < ApplicationRecord
  has_many :users
  validates :name, presence: true
  validates :hourly_rate, presence: true, numericality: true
end
