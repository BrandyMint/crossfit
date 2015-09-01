class Exercise < ActiveRecord::Base
  validates :title, presence: true
end
