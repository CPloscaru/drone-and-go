class BookingsController < ApplicationController
  def index
  end

  def create
    @drone = Drone.find(params[:drone_id])
    @user = User.find(current_user.id)
    @booking = Booking.new(booking_params)
    @booking.drone = @drone
    @booking.customer = @user
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
