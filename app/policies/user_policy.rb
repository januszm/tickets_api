class UserPolicy < ApplicationPolicy

  def index?
    true
  end

  def update?
    @user.admin?
  end

  def show?
    scope.where(id: record.id).exists?# && (@user.id == @record.id || @user.admin?)
  end

  def permitted_attributes
    return [
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
    ]
  end

end
