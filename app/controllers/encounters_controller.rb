class EncountersController < ApplicationController
  before_action :load_expansions

  def index
    @expansion_ids = Array(params[:expansion_ids]).map(&:to_i)
    @expansion_ids = [@base_expansion.id] if @expansion_ids.empty?

    @visiting_ids  = Array(params[:visiting_ids]).map(&:to_i)

    # Locations always update
    @locations = Location.where(expansion_id: @expansion_ids).order(:name)

    # Only draw if explicitly requested
    if params[:commit].present?
      @location_id   = params[:location_id]&.to_i
      @included_expansion_ids = use_visiting_only?(@location_id) ? @visiting_ids : @expansion_ids

      @encounters =
        Encounter
          .includes(:location)
          .includes(:expansion)
          .where(
            location_id: @location_id,
            expansion_id: @included_expansion_ids
          )

      @count = @encounters.count

      if @count > 0
        @index = rand(@count)
        @encounter = @encounters.offset(@index).first
      end
    end
  end

  private

  def load_expansions
    @expansions = Expansion.order(:id)

    @base_expansion = @expansions.first

    @large_expansions = @expansions.where(box_type: "large")
    @small_expansions = @expansions.where(box_type: "small")
    @other_expansions = @expansions.where(box_type: "other")
  end

  def use_visiting_only?(location_id)
    return false if location_id.blank?
    return false if @visiting_ids.empty?

    Location.where(id: location_id, expansion_id: @base_expansion.id).exists?
  end
end
