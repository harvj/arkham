class Expansion < ActiveRecord::Base

  BOX_TYPES = ['Base', 'Large', 'Small', 'Other']

  attr_accessible :name, :box_type

  validates_inclusion_of :box_type, :in => BOX_TYPES

  has_many :neighborhoods
  has_many :locations
  has_many :encounters

  def to_s
    self.name
  end

  scope :base, where(box_type: "Base")
  scope :large, where(box_type: "Large")
  scope :small, where(box_type: "Small")
  scope :other, where(box_type: "Other")
  scope :non_base, where(box_type: ["Large", "Small"])
end
