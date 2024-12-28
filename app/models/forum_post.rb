class ForumPost < ApplicationRecord
  
  CATEGORIES = [
    "Soru & Cevap",
    "Genel",
    "Duyuru",
    "Yardım",
    "Öneri"
  ]

  
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :author_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :category, presence: true, inclusion: { in: CATEGORIES }

  
  default_scope { order(created_at: :desc) }

  
  before_save :sanitize_content

  private

  def sanitize_content
    
    self.content = ActionController::Base.helpers.sanitize(content)
  end
end
