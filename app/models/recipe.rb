class Recipe < ApplicationRecord
  belongs_to :user
  has_one :season, dependent: :destroy
  accepts_nested_attributes_for :season
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

def self.search(search)
  if search
    Recipe.where(['title LIKE ?', "%#{search}%"])
  else
    Recipe.all
  end
end

def
  self.season_search(keyword)
    Season.where(['season ?',"#{keyword}"])
end

end