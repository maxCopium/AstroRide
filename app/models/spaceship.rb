class Spaceship < ApplicationRecord

  include PgSearch::Model

  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  pg_search_scope :search_by_name_location_and_category,
    against: [:name, :location, :category],
    using: {
      tsearch: { prefix: true }
  }
end
