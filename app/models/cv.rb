class Cv < ApplicationRecord
  belongs_to :user
  has_many :cv_skills
  has_many :skills, through: :cv_skills

  enum status: { uploaded: 'Uploaded', pending: 'Pending', approved: 'Approved' }

  validates :file_path, presence: true
  validates :status, inclusion: { in: statuses.keys }
end
