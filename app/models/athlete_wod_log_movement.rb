class AthleteWodLogMovement < ActiveRecord::Base
  include Authority::UserAbilities

  belongs_to :athlete_wod_log
  has_one :athlete_wod, through: :athlete_wod_log
  has_one :athlete, through: :athlete_wod
  has_one :workout, through: :athlete_wod

  belongs_to :workout_movement

  has_one :movement, through: :workout_movement
end
