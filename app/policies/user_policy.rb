class UserPolicy < ApplicationPolicy

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
