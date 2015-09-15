class AthleteWodLog < ActiveRecord::Base
  include Authority::UserAbilities

  belongs_to :athlete_wod

  has_one :athlete, through: :athlete_wod
  has_one :workout, through: :athlete_wod

  has_many :athlete_wod_log_movements
end
