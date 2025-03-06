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

    if params[:max_price].present?
      raise
    end
    
    respond_to do |format|
      format.html # Requête normale
      format.turbo_stream # Turbo mettra à jour la liste
    end

    @price_per_day_max = 50
    @price_per_day_median = 15
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
                                  :flight_time,
                                  :max_altitude,
                                  :max_wind_resistance,
                                  :max_resolution,
                                  :max_flight_distance,
                                  :photo)
  end
end
