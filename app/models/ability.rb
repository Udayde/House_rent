# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage , :all
    return
    can :read, House 
   
    return if user.user?
    can :update, House
    # can :update , House
    return if user.moderator?
    # can :manage , :all
    # return if user.admin?
  end
end
