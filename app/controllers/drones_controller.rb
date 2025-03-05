class DronesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  
  def index
    @drones = Drone.all
    if params[:sort_by]
      case params[:sort_by]
      when "autonomy_rating"
        @drones = @drones.order(autonomy_rating: :desc)
      when "stability_rating"
        @drones = @drones.order(stability_rating: :desc)
      when "range_rating"
        @drones = @drones.order(range_rating: :desc)
      when "price_for_lease"
        @drones = @drones.order(price_for_lease: :asc)
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
