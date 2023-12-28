# frozen_string_literal: true

require 'rails_helper'

RSpec.describe House, type: :model do
  describe 'while creating house' do
    let(:house) { create :house }
    let(:user) { create :user }
    subject{described_class.new}

    it 'should be valid house with all attributes' do
      expect(house).to be_valid
    end

    it 'is not valid without a description' do
      house = House.new(desription: nil)
      expect(house).to_not be_valid
    end

    it 'is not valid without a location' do
      house = House.new(location: nil)
      expect(house).to_not be_valid
    end

    it 'is not valid without a buying_price ' do
      house = House.new(buying_price: nil)
      expect(house).to_not be_valid
    end

    it 'is not valid without a rental_price ' do
      house = House.new(rental_price: nil)
      expect(house).to_not be_valid
    end

    it 'is not valid without a sold  ' do
      house = House.new(sold: nil)
      expect(house).to_not be_valid
    end

    it "has an 'available_for' enum with valid values" do
      expect(House.available_fors.keys).to match_array(%w[buy rent])
    end

    it 'associates with user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'associates with feeds' do
      association = described_class.reflect_on_association(:feeds)
      expect(association.macro).to eq(:has_many)
      expect(association.options).to include(dependent: :destroy)
    end

    it 'has one attached profile_image' do
      expect(House.new.profile_image).to be_an_instance_of(ActiveStorage::Attached::One)
    end

    it 'paginates with 3 items per page' do
      expect(House.default_per_page).to eq(3)
    end

  end

end
