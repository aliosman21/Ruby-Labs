class Ability
  include CanCan::Ability

  def initialize(user)
    #  can :read, Article, public: true

     if user.present?  # additional permissions for logged in users (they can read their own posts)
       can :read, Article

      # if user.admin?  # additional permissions for administrators
      #   can :read, Post
      # end
     end
  end
end