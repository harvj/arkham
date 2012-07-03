class ExpansionsController < ApplicationController

  def index
    @expansions = Expansion.order(:name)
  end

  def new
    @expansion = Expansion.new
  end

  def create
    @expansion = Expansion.new(params[:expansion])
    if @expansion.save
      redirect_to expansions_url, :notice => "awesome. new expansion."
    else
      flash[:alert] = "didn't save."
    end
  end

  def edit
    @expansion = Expansion.find(params[:id])
  end

  def update
    @expansion = Expansion.find(params[:id])
    if @expansion.update_attributes(params[:expansion])
      redirect_to expansions_url, notice: "Expansion updated."
    else
      render 'edit', alert: "Expansion not updated."
    end
  end

end
