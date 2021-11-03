class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    user && user.buyer?
  end
  def create?
    user && user.moderator?
  end
  def categ?
    user.buyer?
  end
  
end
