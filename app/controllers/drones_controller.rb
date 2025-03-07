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
    @drones = Drone.order("#{params[:sort_by]} #{params[:order]}")


   #respond_to do |format|
    # format.html # Charge la page entière (HTML)
    #format.turbo_stream do # Répond aux requêtes Turbo Streams (AJAX)
     # render turbo_stream: turbo_stream.replace("drones-list", partial: "drones", locals: { drones: @drones })
      #end
   # end
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
