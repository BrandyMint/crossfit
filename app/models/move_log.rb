class MoveLog < ActiveRecord::Base
  belongs_to :log
  belongs_to :user
  belongs_to :workout
  belongs_to :move

  delegate :title, to: :move
end
