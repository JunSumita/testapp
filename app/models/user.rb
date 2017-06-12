class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :mail_address, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
validates :name, presence: true
validates :password, presence: true, length: { minimum: 8, message: "8文字以上で入力してください" }, format: { with: /\A[a-z0-9]+\z/i, message: "英数字で入力してください" }

has_many :user_category_relationships, dependent: :destroy
has_many :categories, through: :user_category_relationships
#belongs_to :categoy
end
