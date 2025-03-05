class Drone < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :"owner_id", required: true
  has_many :drone_reviews

  CATEGORIES = %w(Type1 Type2 Type3)
  validates_associated :owner
  validates :description, length: { minimum: 12}
  validates :name, presence: true
  validates :category, presence: true
  validates :category, inclusion: {in: CATEGORIES,
    message: "%{value} is not a valid category"}

  validates :price_per_day, presence: true
  validates :autonomy_rating, presence: true
  validates :stability_rating, presence: true
  validates :camera_quality_rating, presence: true
  validates :range_rating, presence: true


  validates :price_per_day, numericality: true
  validates :price_for_lease, numericality: true
  validates :autonomy_rating, numericality: {greater_than: 0, less_than_or_equal_to:5}
  validates :stability_rating, numericality: {greater_than: 0, less_than_or_equal_to:5}
  validates :camera_quality_rating, numericality: {greater_than: 0, less_than_or_equal_to:5}
  validates :range_rating, numericality:{greater_than: 0, less_than_or_equal_to:5}
end
def display_rating(rating)
  full_star = "★"
  empty_star = "☆"
  full_star * rating + empty_star * (5 - rating)
end
