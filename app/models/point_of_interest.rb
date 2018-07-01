class PointOfInterest < ApplicationRecord
  validates :name, :x, :y, presence: true
  validates :name, uniqueness: true

  scope :x_lteq, -> (x_max) { where('x <= ?', x_max) }
  scope :x_gteq, -> (x_min) { where('x >= ?', x_min) }
  scope :y_lteq, -> (y_max) { where('y <= ?', y_max) }
  scope :y_gteq, -> (y_min) { where('y >= ?', y_min) }
  scope :x_closeness, -> (x, max_distance) { x_lteq(x + max_distance).x_gteq(x - max_distance) }
  scope :y_closeness, -> (y, max_distance) { y_lteq(y + max_distance).y_gteq(y - max_distance) }
  scope :closeness, -> (x, y, max_distance) { x_closeness(x, max_distance).y_closeness(y, max_distance) }
end
