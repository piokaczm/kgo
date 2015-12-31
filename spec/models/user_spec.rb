require 'rails_helper'

RSpec.describe User do
  skip 'validation' do
    subject { create :user }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
    it { is_expected.to validate_length_of(:username).is_at_most(20) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_inclusion_of(:wojewodztwo).in_array(User::WOJLIST) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
