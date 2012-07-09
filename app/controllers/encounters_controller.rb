class EncountersController < ApplicationController

  def index
    locations_in_play = Location.where(expansion_id: params[:expansions]).order(:name)
    @location_choices = locations_in_play.any? ? locations_in_play : Location.base.order(:name)
    
    if params[:location] and params[:expansions]
      included_expansions = params[:visiting] ||= params[:expansions]
      @encounters = Encounter.for_location(params[:location]).where(expansion_id: included_expansions)
      @index = rand(@encounters.count)
      @encounter = @encounters[@index]
    end

    respond_to do |f|
      f.html
      f.js { render 'result' }
    end
  end

  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy
    redirect_to :back
  end

end
