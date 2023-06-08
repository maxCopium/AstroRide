class Spaceship < ApplicationRecord

  include PgSearch::Model

  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_many_attached :photos

  pg_search_scope :search_by_name_location_and_category,
    against: [:name, :location, :category],
    using: {
      tsearch: { prefix: true }
  }
end
