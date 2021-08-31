class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
  has_many :recipes, dependent: :destroy

  def self.user_search(user_name_to_search)
    if user_name_to_search
      User.where(['name LIKE ?', "%#{user_name_to_search}%"])
    else
      User.all
    end
  end
end
