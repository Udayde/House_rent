# frozen_string_literal: true

class Ability
  include CanCan::Ability

 

  def initialize(user)
    # if user.moderator?
    #   can :destroy, User, role: 'user'
    # end

    can :read, House
    if user.user?
      alias_action :create, :update, :destroy, to: :actions
      can :actions, House
      can :destroy, User, role: 'user'
    end
   
    if user.moderator?

    # can :destroy , :User
    can :destroy ,User,role: "moderator"
   
    return if user.admin?

  end
end
