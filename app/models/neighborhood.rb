class Neighborhood < ActiveRecord::Base
  attr_accessible :name, :expansion_id

  belongs_to :expansion
  has_many :locations
end
