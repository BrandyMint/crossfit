class Log < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout
  belongs_to :wod
  has_many :move_logs

  validates :date, presence: true

  accepts_nested_attributes_for :move_logs, reject_if: :all_blank, allow_destroy: true

  def self.new_from_wod(wod)
    new(wod: wod, workout: wod.workout)
  end

  def prepopulate_data_from_workout
    workout.moves.each do |move|
      move_logs.build({ move: move }.merge(move.params))
    end
  end
end
