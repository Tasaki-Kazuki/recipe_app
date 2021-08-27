class Recipe < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  enum season: { unspecified: 0, spring: 1, summer: 2, fall: 3, winter: 4 }
  validates :season, presence: true
  def self.title_search(title_search)
    if title_search
      Recipe.where(['title LIKE ?', "%#{title_search}%"])
    else
      Recipe.all
    end
  end

  def self.season_search(season_search)
    if season_search
      Recipe.where(season: season_search)
    else
      Recipe.all
    end
  end
end
