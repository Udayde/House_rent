# frozen_string_literal: true

# house model
class House < ApplicationRecord
  enum :available_for, { buy: 0, rent: 1 }
  belongs_to :user
  has_one_attached :profile_image
  has_many :feeds, dependent: :destroy
  # validates :location, presence: true
  validates :location, presence: true
  # before_save :bar_search
  paginates_per 3

  def self.ransackable_attributes(_auth_object = nil)
    %w[available_for buying_price created_at desription id location rental_price sold
       updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['user']
  end
end
