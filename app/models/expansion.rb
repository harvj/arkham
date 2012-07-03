class Expansion < ActiveRecord::Base
  attr_accessible :name

  has_many :neighborhoods
  has_many :locations
  has_many :encounters

  def to_s
    self.name
  end
end
