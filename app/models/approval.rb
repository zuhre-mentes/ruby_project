class Approval < ApplicationRecord
    belongs_to :cv
    belongs_to :approved_by, class_name: 'User'
  
    enum status: { pending: 'Pending', approved: 'Approved', rejected: 'Rejected' }
  
    validates :status, inclusion: { in: statuses.keys }
  end
  