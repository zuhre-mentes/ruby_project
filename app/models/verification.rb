class Verification < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  
  has_one_attached :file
  
  validates :status, inclusion: { in: ['pending', 'approved', 'rejected'] }
end
