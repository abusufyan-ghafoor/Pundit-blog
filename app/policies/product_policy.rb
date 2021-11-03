class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    user && user.moderator?
  end
  def create?
    user && user.moderator?
  end
  def show?
    user && user.moderator?
  end
  def prod?
    user && user.moderator?
  end
end
