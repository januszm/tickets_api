class IssuePolicy < ApplicationPolicy

  def assign?
    @user.support_agent? || @user.admin?
  end

  def finalize
    assign?
  end

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
    [@record.creator_id, @record.assignee_id].include?(@user.id) || @user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    @user.id == @record.creator_id || @user.admin?
  end

  def permitted_attributes
    return [
      :title,
      :description,
      :creator_id,
      :assignee_id,
    ]
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
