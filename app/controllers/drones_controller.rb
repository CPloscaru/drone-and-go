class DronesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @drones = Drone.all
    sort_by = params[:sort_by]
    order = params[:order] || "desc" #tri décroissant

    # Inverser l'ordre
    if sort_by == session[:last_sort_by]
      order = (order == "desc") ? "asc" : "desc"
    else
      order = "desc" # Reset apres
    end

    # Enregistrer le dernier critère de tri dans la session
    session[:last_sort_by] = sort_by

    # tri
    if sort_by.present?
      @drones = @drones.order("#{sort_by} #{order}")
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
