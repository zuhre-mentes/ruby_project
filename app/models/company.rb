class Company < ApplicationRecord
  # Devise modülleri
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # İlişkiler
  has_many :positions, dependent: :destroy
  has_one_attached :logo

  validates :name, presence: true
  
  # Logo validasyonları (opsiyonel)
  validates :logo,
            content_type: { in: ['image/png', 'image/jpeg', 'image/jpg'], message: 'PNG, JPEG veya JPG formatında olmalıdır' },
            size: { less_than: 5.megabytes, message: '5MB\'dan küçük olmalıdır' },
            if: :logo_attached?

  private

  def logo_attached?
    logo.attached?
  end

  # Ransackable özellikler
  def self.ransackable_attributes(auth_object = nil)
    %w[id name description website badge_requirements created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[positions user]
  end
end


