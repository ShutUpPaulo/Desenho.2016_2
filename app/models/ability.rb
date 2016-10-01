# Ability model for CanCan
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? 'admin'
      can :manage, :all
    elsif user.role? 'cook'
      can [:read, :create], Ingredient
    else # guest user (not logged in)
      can :read, :all
    end
  end
end
