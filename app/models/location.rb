class Location < ActiveRecord::Base
  attr_accessible :name, :neighborhood_id, :expansion_id

  belongs_to :neighborhood
  belongs_to :expansion

  has_many :encounters

  scope :base, where( expansion_id: 1 )

  def to_s
    self.name
  end
end
