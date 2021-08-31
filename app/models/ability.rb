
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in) 
      if user.type == "Admin"
        can :manage, :all
        cannot [:add_to_cart], Product
      else
        can [:read,:add_to_cart,:remove_from_cart], Product
    end
  end
end
