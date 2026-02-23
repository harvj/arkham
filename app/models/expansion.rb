class Expansion < ApplicationRecord
  before_validation :normalize_box_type

  private

  def normalize_box_type
    self.box_type = box_type&.downcase
  end
end
