require 'rails_helper'

RSpec.describe User, type: :model do

  describe User.new(first_name: 'John', last_name: 'Doe') do
    it { is_expected.to have_attributes(first_name: 'John') }
    it { is_expected.to have_attributes(last_name: 'Doe') }
  end

end
