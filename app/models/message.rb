class Message < ApplicationRecord
  belongs_to :user
  belongs_to :badge, optional: true

  validates :content, presence: true
end 