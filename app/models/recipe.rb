class Recipe < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
<<<<<<< HEAD

def self.search(search)
  if search
    Recipe.where(['title LIKE ?', "%#{search}%"])
  else
    Recipe.all
  end
end



=======
  enum season: { unspecified: 0, spring: 1, summer: 2, fall: 3, winter: 4 }
>>>>>>> c7c02fa (seasonカラムをrecipesデーブルに追加して新規投稿、編集時の入力、レシピページに表示するよページに表示するようにしました)
end
