class DroneReview < ApplicationRecord
  belongs_to :drone

  validates :rating, numericality: {greater_than: 0, less_than_or_equal_to:5}
  validates_associated :drone
  validates :comment, length: { minimum: 12}
end
