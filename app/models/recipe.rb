class Recipe < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  enum season: { unspecified: 0, spring: 1, summer: 2, fall: 3, winter: 4 }
  validates :season, presence: true
  def self.search(search)
    if search
      Recipe.where(['title LIKE ?', "%#{search}%"])
    else
      Recipe.all
    end
  end

  def self.seasonsearch(seasonsearch)
    if seasonsearch
      Recipe.where(season: seasonsearch)
    else
      Recipe.all
    end
  end
end
