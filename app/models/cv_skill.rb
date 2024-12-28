class CvSkill < ApplicationRecord
  belongs_to :cv
  belongs_to :skill

  validates :cv, presence: true
  validates :skill, presence: true
end
