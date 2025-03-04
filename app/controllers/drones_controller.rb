class DronesController < ApplicationController
  def index
    @drones = Drone.all
  end

  def new
  end

  def show
  end
end
