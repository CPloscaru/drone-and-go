class DronesController < ApplicationController
  def index
    @drones = Drone.all
  end
end
