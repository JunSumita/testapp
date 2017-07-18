class Category < ApplicationRecord
    acts_as_nested_set

    has_many :user_category_relationships, dependent: :destroy, foreign_key: "category_id"
    has_many :users , through: :user_category_relationships, inverse_of: :category
end
