class DronesController < ApplicationController
  def index
    @drones = Drone.all
  end

  def new

  end

  def show
    @drone = Drone.find(params[:id])
    @booking = Booking.new
  end
end
