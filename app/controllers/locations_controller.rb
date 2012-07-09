class LocationsController < ApplicationController

  def show
    @location = Location.find params[:id]
    if params[:e]
      @expansion = Expansion.find(params[:e])
      @encounters = Encounter.where(location_id: @location.id, expansion_id: @expansion.id)
    else
      @encounters = Encounter.where(location_id: @location.id)
    end
  end
end
