class Skill < ApplicationRecord
    has_many :cv_skills
    has_many :cvs, through: :cv_skills
    has_and_belongs_to_many :badges
  
    validates :name, presence: true, uniqueness: true
  end

