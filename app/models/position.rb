class Position < ApplicationRecord
    belongs_to :company
    has_many :applications
  
    validates :title, :description, :application_deadline, presence: true  # application_deadline'ı ekledik
  
    # Ransackable associations ekleyin
    def self.ransackable_associations(auth_object = nil)
      super + %w[company applications]
    end
  
    # Ransackable attributes ekleyin
    def self.ransackable_attributes(auth_object = nil)
      super + %w[title description application_deadline]  # application_deadline'ı ekledik
    end
  end
  