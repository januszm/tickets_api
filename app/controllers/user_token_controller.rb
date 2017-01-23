class UserTokenController < Knock::AuthTokenController

  def auth_params
    params.permit(:email, :password)
  end

end
