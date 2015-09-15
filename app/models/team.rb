class Team < ActiveRecord::Base
  include Authority::UserAbilities

  belongs_to :owner, class_name: 'User'
  has_many :memberships
  has_many :members, through: :memberships

  validates :owner_id, presence: true
  validates :slug, uniqueness: true, presence: true
  validates :title, uniqueness: true, presence: true

  after_create :add_owner_as_member

  private

  def add_owner_as_member
    memberships.create! member: owner, role: :owner
  end
end
