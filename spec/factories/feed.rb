# frozen_string_literal: true

FactoryBot.define do
  factory :feed do
    name { 'admin' }
    feedback { 'good' }
    association :user, factory: :user
    association :house, factory: :house
  end
end
