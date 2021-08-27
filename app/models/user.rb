class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
  has_many :recipes, dependent: :destroy
  has_many :favorites_list,  through: :favorites, source: :recipe

  def self.usersearch(usersearch)
    if usersearch
      User.where(['name LIKE ?', "%#{usersearch}%"])
    else
      User.all
    end
  end

  def favorite(recipe)
    :favorites_list <<recipe

  end

end
