class PointOfInterest < ApplicationRecord
  validates :name, :x, :y, presence: true
  validates :name, uniqueness: true
end
