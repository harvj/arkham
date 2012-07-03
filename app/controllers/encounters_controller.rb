class EncountersController < ApplicationController

  def index
    if params[:location] and params[:expansions]
      @encounters = Encounter.for_location(params[:location]).where(expansion_id: params[:expansions])
      @encounter = @encounters[rand(@encounters.count)]
    end

    respond_to do |f|
      f.html
      f.js { render 'result' }
    end
  end

end
