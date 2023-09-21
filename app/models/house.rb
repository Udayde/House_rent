class House < ApplicationRecord
    enum :available_for, {buy:0, rent:1} 
    belongs_to :user
    has_one_attached :profile_image
end
