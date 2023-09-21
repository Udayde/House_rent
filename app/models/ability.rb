# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, House
   
    return if user.client?
    can :update, House
    # can :update , House
    can :manage , :all
    return if user.moderator?
    # can :manage , :all
    # return if user.admin?
  end
end
