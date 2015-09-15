class Movement < ActiveRecord::Base
  PARAMS = %i(reps weight_kilos distance_meters height_meters time_seconds)

  belongs_to :author, class_name: 'User'

  validates :reps, :time_seconds,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
  validates :weight_kilos, :distance_meters, :height_meters,
            numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

  def params
    attributes.slice(*PARAMS.map(&:to_s))
  end
end
