class Verification < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  
  has_many_attached :files
  
  validates :status, inclusion: { in: ['pending', 'approved', 'rejected'] }
end
