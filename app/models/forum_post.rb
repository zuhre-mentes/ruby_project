class ForumPost < ApplicationRecord
  # Kategoriler
  CATEGORIES = [
    "Soru & Cevap",
    "Genel",
    "Duyuru",
    "Yardım",
    "Öneri"
  ]

  # Validasyonlar
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :author_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :category, presence: true, inclusion: { in: CATEGORIES }

  # Varsayılan sıralama
  default_scope { order(created_at: :desc) }

  # Callback'ler
  before_save :sanitize_content

  private

  def sanitize_content
    # HTML güvenliği için içeriği temizle
    self.content = ActionController::Base.helpers.sanitize(content)
  end
end
