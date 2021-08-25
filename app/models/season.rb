class Season < ApplicationRecord
  belongs_to :recipe
  validates :season, presence: true



  def self.season_search(keyword)
    if keyword
      Season.where(['season LIKE?',"%#{keyword}%"])
    else
      Season.all
    end
  end
end
