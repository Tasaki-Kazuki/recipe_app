class Season < ApplicationRecord
  belongs_to :recipe
  validates :season, presence: true
end
