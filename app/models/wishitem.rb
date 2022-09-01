class Wishitem < ApplicationRecord
    belongs_to :user
    attachment :image
    
    with_options presence: true do
        validates :name
        validates :description
    end
end
