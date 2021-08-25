class Recipe < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  enum season: { unspecified: 0, spring: 1, summer: 2, fall: 3, winter: 4 }
end
