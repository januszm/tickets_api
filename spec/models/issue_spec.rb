require 'rails_helper'

RSpec.describe Issue, type: :model do

  it { is_expected.to belong_to :creator }
  it { is_expected.to belong_to :assignee }

  describe Issue.new(title: 'A', description: 'B') do
    it { is_expected.to have_attributes(title: 'A') }
    it { is_expected.to have_attributes(description: 'B') }
  end

end
