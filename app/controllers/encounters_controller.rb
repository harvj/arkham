class EncountersController < ApplicationController

  def index
    if params[:location] && params[:expansions]
      @encounters = Encounter.for_location(params[:location]).where(expansion_id: params[:expansions])
    else
      @encounters = Encounter.all
    end
    @encounter = @encounters[rand(@encounters.count)]
  end

end
