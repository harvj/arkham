class Encounter < ActiveRecord::Base
  attr_accessible :expansion_id, :location_id, :text

  belongs_to :location
  belongs_to :expansion
end
