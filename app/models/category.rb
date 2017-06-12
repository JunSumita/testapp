class Category < ApplicationRecord
    has_many :user_category_relationships, dependent: :destroy
    has_many :users , through: :user_category_relationships
end
