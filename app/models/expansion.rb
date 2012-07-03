class Expansion < ActiveRecord::Base

  BOX_TYPES = ['Base', 'Large', 'Small']

  attr_accessible :name, :box_type

  validates_inclusion_of :box_type, :in => BOX_TYPES

  has_many :neighborhoods
  has_many :locations
  has_many :encounters

  def to_s
    self.name
  end
end
