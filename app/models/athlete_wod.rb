class AthleteWod < ActiveRecord::Base
  include Authority::UserAbilities

  belongs_to :workout
  belongs_to :athlete, class_name: 'User'
  belongs_to :trainer, class_name: 'User'

  has_one :athlete_wod_log

  scope :chrono, -> { order(date: :desc) }

  validates :date, presence: true, uniqueness: :athlete_id

  def self.find_wod_for_date(date)
    self.where(date: date).first
  end

  def logged?(user)
    logs.where(user: user).exists?
  end
end
