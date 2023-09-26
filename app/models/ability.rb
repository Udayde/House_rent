# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, House 
   
    return if user.user?
    can :update, House
    can :create , House
    can :destroy, House
    can :destroy, User
    return if user.moderator?
    # can :manage , :all
    # return if user.admin?
  end
end
