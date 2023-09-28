# frozen_string_literal: true

class Ability
  include CanCan::Ability

 

  def initialize(user)

    if user.user? || user.admin? || user.moderator?
      can :read, House
    end
    

    if user.moderator?
      alias_action :create, :update, :destroy, to: :actions
      can :actions, House
      can :destroy, User, role: 'user'
      can :destroy,Feed
    end
    

    if user.admin?
      alias_action :create, :update, :destroy, to: :actions
      can :actions, House
      can :destroy ,User,role: "moderator"
    end
   
  end
  
end
