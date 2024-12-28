class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  validates :user, presence: true
  validates :badge, presence: true
end
