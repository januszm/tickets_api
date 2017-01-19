def authenticated_header_for(user)
  token = Knock::AuthToken.new(payload: { sub: user.id }).token
  { 'Authorization': "Bearer #{token}" }
end
