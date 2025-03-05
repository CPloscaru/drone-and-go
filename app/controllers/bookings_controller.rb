class BookingsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @customer_bookings = Booking.where(customer_id: @user.id)
    @owner_bookings = Booking.all.select do |booking|
      Drone.find(booking.drone_id).owner_id == booking.customer_id
    end
  end

  def create
    @drone = Drone.find(params[:drone_id])
    @user = User.find(current_user.id)
    @booking = Booking.new(booking_params)
    @booking.total_price = 350
    @booking.drone = @drone
    @booking.customer = @user
    if @booking.save
      redirect_to bookings_path
    else
      flash[:alert] = @booking.errors.full_messages
      redirect_to drone_path(@drone)
      #render "bookings/form", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
