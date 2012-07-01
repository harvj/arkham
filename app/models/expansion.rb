class Expansion < ActiveRecord::Base
  attr_accessible :name

  has_many :neighborhoods
  has_many :locations
  has_many :encounters
end
