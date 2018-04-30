class Comment < ApplicationRecord

  validates :body, {presence: true, length: {maximum: 6}, length: {minimum: 4}}
  validates :body2, {presence: true, length: {maximum: 8}, length: {minimum: 6}}
  validates :body3, {presence: true, length: {maximum: 6}, length: {minimum: 4}}
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :topic

end
