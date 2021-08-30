class Recipe < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  enum season: { unspecified: 0, spring: 1, summer: 2, fall: 3, winter: 4 }
  validates :season, presence: true
  def self.title_search(recipe_title_to_search)
    if recipe_title_to_search
      Recipe.where(['title LIKE ?', "%#{recipe_title_to_search}%"])
    else
      Recipe.all
    end
  end

  def self.season_search(season_to_search)
    if season_to_search
      Recipe.where(season: season_to_search)
    else
      Recipe.all
    end
  end
end
