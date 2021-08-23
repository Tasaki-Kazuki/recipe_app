class Recipe < ApplicationRecord
  belongs_to :user
  has_one :season, dependent: :destroy
  accepts_nested_attributes_for :season
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
