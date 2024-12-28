class Badge < ApplicationRecord
  belongs_to :badge_category
  has_many :user_badges
  has_and_belongs_to_many :skills
  has_many :users, through: :user_badges

  validates :name, presence: true
  validates :badge_category, presence: true
end
