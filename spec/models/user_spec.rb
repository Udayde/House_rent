# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'when creating user' do
    let(:user) { create :user }

    it 'should be valid user with all attributes' do
      expect(user).to be_valid
    end

    it 'it should not be valid without name attribute' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it 'it should not be valid without email attribute' do
      user = User.new(email: nil)
      expect(user).to_not be_valid
    end

    it 'associates with house' do
      association = described_class.reflect_on_association(:houses)
      expect(association.macro).to eq(:has_many)
      expect(association.options).to include(dependent: :destroy)
    end

    it "has a 'role' enum with valid values" do
      expect(User.roles.keys).to match_array(%w[user moderator admin])
    end
  end
end
