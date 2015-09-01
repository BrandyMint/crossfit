class Workout < ActiveRecord::Base
  has_many :moves
  has_many :logs

  validates :title, presence: true
  validates :rounds, presence: true, numericality: { only_integer: true, greater_than: 0 }

  accepts_nested_attributes_for :moves, reject_if: :all_blank, allow_destroy: true
end
