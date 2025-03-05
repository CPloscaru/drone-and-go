class DronesController < ApplicationController
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

  def new
  end

  def show
  end
end
end
