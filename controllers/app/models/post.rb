class Post < ApplicationRecord
  validates :category, presence: true
  belongs_to :user
  has_many :comments
end
