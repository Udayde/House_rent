# frozen_string_literal: true

# class feed
class Feed < ApplicationRecord
  belongs_to :house
  belongs_to :user
end
