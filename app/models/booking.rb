class Booking < ApplicationRecord
  belongs_to :drone
  belongs_to :customer, class_name: "User", foreign_key: :"customer_id", required: true

  validates_associated :drone, :customer
  validates :starting_date, presence: true
  validates :ending_date, presence: true
  validates :total_price, presence: true

  validates :ending_date, comparison: { greater_than: :starting_date }
  validates :starting_date, comparison: { greater_than: Date.today,
                          message: "The starting date of a booking cannot be in the past"}

end
