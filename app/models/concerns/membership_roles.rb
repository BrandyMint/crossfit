module MembershipRoles
  extend ActiveSupport::Concern

  ROLES = %I(superadmin owner manager athlet guest)
  DEFAULT_ROLE = :manager

  included do
    extend Enumerize

    validates :role, presence: true
    enumerize :role, in: ROLES, default: DEFAULT_ROLE, predicates: true

    before_save do
      fail "Can not save member with superadmin role for operator #{operator_id}" if superadmin?
    end
  end

  def admin?
    owner? || manager? || superadmin?
  end
end
