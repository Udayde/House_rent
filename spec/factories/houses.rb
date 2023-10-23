# frozen_string_literal: true

FactoryBot.define do
  factory :house do
    desription { '1bhk' }
    location { 'indore' }
    buying_price { 1400 }
    rental_price { 1500 }
    # user_id { 1 }
    association :user, factory: :user
    sold { false }
    available_for { 'buy' }
  end
end
