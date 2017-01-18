require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }

  def authenticated_header_for(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    { 'Authorization': "Bearer #{token}" }
  end

  context 'for authenticated user' do
    it 'responds successfully' do
      get users_url, headers: authenticated_header_for(user)
      assert_response :success
    end
  end

  context 'for not authenticated users' do
    it 'responds with Unauthorized' do
      get users_url
      assert_response :unauthorized
    end
  end

end
