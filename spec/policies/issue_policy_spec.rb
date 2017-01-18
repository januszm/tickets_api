require 'rails_helper'

RSpec.describe IssuePolicy do

  let(:user) { create(:user) }

  subject { described_class }

  permissions :index? do
    it 'denies access if user does not exist' do
      expect(subject).not_to permit(build(:user), Issue.all)
    end

    it 'grants access if user exists' do
      expect(subject).to permit(user, Issue.all)
    end
  end

end
