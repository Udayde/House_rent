# frozen_string_literal: true

class Ability
  include CanCan::Ability

 

  def initialize(user)
    debugger
    can :read, House
    return if user.user?
    alias_action :create, :update, :destroy, to: :actions
    can :actions, House
    can :destroy, User, role: 'user'
    return if user.moderator?

    can :destroy , :User
    return if user.admin?
  end
end
