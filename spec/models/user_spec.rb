# frozen_string_literal: true

require 'rails_helper'






RSpec.describe User, type: :model do
  context 'when creating user' do
    let(:user) { build :user }

    it 'should be valid user with all attributes' do
      # user.valid? == true
      expect(user).to be_valid
    end
  end
end
