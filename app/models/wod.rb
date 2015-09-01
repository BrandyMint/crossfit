class Wod < ActiveRecord::Base
  belongs_to :workout
  has_many :logs

  scope :chrono, -> { order(date: :desc) }

  validates :date, presence: true

  def self.find_wod_for_date(date)
    self.where(date: date).first
  end

  def logged?(user)
    logs.where(user: user).exists?
  end
end
