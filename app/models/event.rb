class Event < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :date, presence: true
    belongs_to :user
end