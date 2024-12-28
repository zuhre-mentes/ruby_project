class BadgeCategory < ApplicationRecord
    has_many :badges
  
    validates :name, presence: true, uniqueness: true
  end
