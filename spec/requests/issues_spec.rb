require 'rails_helper'

RSpec.describe 'Issues', type: :request do
  let(:user) { create(:user) }

  context 'for authenticated user' do
    it 'responds successfully' do
      get issues_url, headers: authenticated_header_for(user)
      assert_response :success
    end
  end

  context 'for not authenticated users' do
    it 'responds with Unauthorized' do
      get issues_url
      assert_response :unauthorized
      get assign_issues_url
      assert_response :unauthorized
    end
  end

end
