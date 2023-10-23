# frozen_string_literal: true

# spec/models/feed_spec.rb
require 'rails_helper'

RSpec.describe Feed, type: :model do
  let(:user) { create(:user, email: 'uniq1@gmail.com') }
  let(:house) { create(:house) }

  describe 'associations' do
    it 'belongs to a user' do
      feed = Feed.new(user: user)
      expect(feed.user).to eq(user)
    end

    it 'belongs to a house' do
      feed = Feed.new(house: house)
      expect(feed.house).to eq(house)
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      feed = Feed.create(user: user, house: house, feedback: 'good')
      expect(feed).to be_valid
    end

    it 'is not valid without a user' do
      feed = Feed.new(house: house, feedback: 'good')
      expect(feed).not_to be_valid
    end

    it 'is not valid without a house' do
      feed = Feed.new(user: user, feedback: 'good')
      expect(feed).not_to be_valid
    end

    it 'is not valid without feedback' do
      feed = Feed.new(user: user, house: house, feedback: nil)
      expect(feed).not_to be_valid
    end
  end
end
