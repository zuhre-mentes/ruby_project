class Position < ApplicationRecord
    belongs_to :company
    has_many :applications
  
    validates :title, :description, :application_deadline, presence: true  
  
    
    def self.ransackable_associations(auth_object = nil)
      super + %w[company applications]
    end
  
    
    def self.ransackable_attributes(auth_object = nil)
      super + %w[title description application_deadline]  
    end
  end
  