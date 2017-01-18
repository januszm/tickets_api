class IssuePolicy < ApplicationPolicy

  def index?
    @user.id
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    index?
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    @user.admin?
  end

  def permitted_attributes
    return [
      :title,
      :description,
      :assignee_id,
    ]
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
