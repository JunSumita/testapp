class Category < ApplicationRecord
    has_many :user_category_relationships, dependent: :destroy, foreign_key: "category_id", inverse_of: :category
    has_many :users , through: :user_category_relationships
end
