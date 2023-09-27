class House < ApplicationRecord
    enum :available_for, {buy:0, rent:1} 
    belongs_to :user
    has_one_attached :profile_image
    has_many :feeds, dependent: :destroy
    # before_save :bar_search

    def self.ransackable_attributes(auth_object = nil)
        ["available_for", "buying_price", "created_at", "desription", "id", "location", "rental_price", "sold", "updated_at", "user_id"]
      end

      # def bar_search
      #   self.serch = [desription, location].reject(&:blank?).join(" ")
      # end
end
