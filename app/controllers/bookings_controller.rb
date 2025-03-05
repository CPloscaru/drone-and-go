class BookingsController < ApplicationController
  def index # test
    @user = User.find(current_user.id)
    @customer_bookings = Booking.where(customer_id: @user.id)
    @owner_bookings = Booking.all.select do |booking|
      Drone.find(booking.drone_id).owner_id == booking.customer_id
    end
  end
end
