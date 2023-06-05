class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :price, numericality: { greater_than_or_equal_to: 0}
end
