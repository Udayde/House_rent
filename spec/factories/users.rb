# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'me' }
    email { 'test@example.com' }
    password { '123456' }
    role { 'admin' }
  end
end
