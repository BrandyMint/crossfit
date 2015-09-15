class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :athlete_wods, as: :athlete
  has_many :athlete_wod_logs, as: :athlete
  has_many :athlete_wod_log_movements

  has_many :workouts, as: :owner

  validates :nick, uniqueness: true, presence: true, slug: true
  validates :email, uniqueness: true, email: true, allow_blank: true
  validates :phone, uniqueness: true, phone: true, presence: true
  validates :password, confirmation: true

  before_create :generate_pin

  private

  def generate_pin
    self.pin = SecureRandom.hex 2
  end
end
