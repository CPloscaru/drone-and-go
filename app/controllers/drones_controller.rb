class DronesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @drones = Drone.all
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
