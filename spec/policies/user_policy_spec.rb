require 'rails_helper'

RSpec.describe UserPolicy do
  let(:user) { build(:user) }
  let(:admin) { build(:user, :admin) }

  subject { described_class }

  permissions :update? do
    it 'denies access if user is not an admin' do
      expect(subject).not_to permit(user, User.last)
    end

    it 'grants access if user is an admin' do
      expect(subject).to permit(admin, User.last)
    end
  end

end
