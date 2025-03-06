class DronesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @drones = Drone.all
    if params[:sort_by]
      case params[:sort_by]
      when "flight_time"
        @drones = @drones.order(flight_time: :asc)
      when "max_altitude"
        @drones = @drones.order(max_altitude: :asc)
      when "max_wind_resistance"
        @drones = @drones.order(max_wind_resistance: :asc)
      when "max_resolution"
        @drones = @drones.order(max_resolution: :asc)
      when "max_flight_distance"
        @drones = @drones.order(max_flight_distance: :asc)
      when "price_per_day"
        @drones = @drones.order(price_per_day: :asc)
      end
    end
  end

  def new
    @drone = Drone.new
  end

  def create
    @drone = Drone.new(drone_params)
    @drone.owner = User.find(current_user.id)
    if @drone.save
      redirect_to drone_path(@drone)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @drone = Drone.find(params[:id])
    @booking = Booking.new
  end

  private

  def drone_params
    params.require(:drone).permit(:name,
                                  :description,
                                  :category,
                                  :price_per_day,
                                  :price_for_lease,
                                  :autonomy_rating,
                                  :stability_rating,
                                  :camera_quality_rating,
                                  :range_rating)
  end
end
