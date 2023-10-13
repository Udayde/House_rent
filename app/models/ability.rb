# frozen_string_literal: true

# ability model
class Ability
  include CanCan::Ability

  def initialize(user)
    setup_common_permissions(user)
    setup_moderator_permissions(user) if user.moderator?
    setup_admin_permissions(user) if user.admin?
  end

  private

  def setup_common_permissions(user)
    return unless user.user? || user.admin? || user.moderator?

    can :read, House
    can :destroy, Feed, user_id: user.id
  end

  def setup_moderator_permissions(_user)
    alias_action :create, :update, :destroy, to: :actions
    can :actions, House
    can :destroy, User, role: 'user'
    can :update, User, role: 'user'
    can :destroy, Feed
  end

  def setup_admin_permissions(_user)
    alias_action :create, :update, :destroy, to: :actions
    can :actions, House
    can :destroy, User, role: 'moderator'
    # can :destroy, User, role: 'user'
  end
end
