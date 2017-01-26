require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }

  context 'for authenticated user' do
    it 'responds successfully' do
      get users_url, headers: authenticated_header_for(user)
      assert_response :success
    end

    it 'responds successfully for admin' do
      patch user_url(user), params: { user: { first_name: 'Bob' } }, headers: authenticated_header_for(admin)
      assert_response :success
    end

    it 'raises error for non-admin' do
      expect {
        patch user_url(admin), params: { user: { first_name: 'Bob' } }, headers: authenticated_header_for(user)
      }.to raise_error Pundit::NotAuthorizedError
    end
  end

  context 'for not authenticated users' do
    it 'responds with Unauthorized' do
      get users_url
      assert_response :unauthorized
    end
  end

end
