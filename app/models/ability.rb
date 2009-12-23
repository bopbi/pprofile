class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.id != nil
      can :manage, :all
    else
      can :read, [News, Image, Service]
      can :create, Contact
    end
  end
end