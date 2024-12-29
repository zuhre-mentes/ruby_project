class Post < ApplicationRecord
  # Validations
  validates :content, presence: true
  validates :description, presence: true, if: :is_event? # Eğer is_event true ise açıklama zorunlu
  validates :date, presence: true, if: :is_event?       # Eğer is_event true ise tarih zorunlu

  # Associations
  belongs_to :user
  has_many :user_events, dependent: :destroy
  has_many :attendees, through: :user_events, source: :user
  

  # Helper Methods
  def is_event?
    is_event
  end
end

