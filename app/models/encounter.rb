class Encounter < ActiveRecord::Base
  attr_accessible :expansion_id, :location_id, :description

  belongs_to :location
  belongs_to :expansion

  scope :for_location,  ->(location)   { where("location_id = ?", location) }

  def board
    self.location.expansion
  end

  def to_s
    self.description.html_safe
  end
end
