class Move < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise

  validates :reps, :time_seconds,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
  validates :weight_kilos, :distance_meters, :height_meters,
            numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

  delegate :title, to: :exercise
end
