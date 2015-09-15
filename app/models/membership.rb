class Membership < ActiveRecord::Base
  include MembershipRoles

  belongs_to :team
  belongs_to :member, class_name: 'User'

  validates :team_id, presence: true
  validates :member_id, presence:true, uniqueness: [:team_id]

  delegate :full_name, :nick, to: :member
end
