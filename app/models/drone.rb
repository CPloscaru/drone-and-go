class Drone < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :"owner_id", required: true
  has_many :drone_reviews
  has_one_attached :photo

  validates_associated :owner
  validates :description, length: { minimum: 12}
  validates :name, presence: true

  validates :price_per_day, presence: true
  validates :flight_time, presence: true
  validates :max_altitude, presence: true
  validates :max_wind_resistance, presence: true
  validates :max_resolution, presence: true
  validates :max_flight_distance, presence: true

  def display_rating(rating)
    full_star = "★"
    empty_star = "☆"
    full_star * rating + empty_star * (5 - rating)
  end

end
