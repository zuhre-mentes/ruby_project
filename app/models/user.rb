class User < ApplicationRecord
  # Doğrulamalar
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true, inclusion: { in: %w[student academic], message: "%{value} geçerli bir rol değil" }

  # Şifreyi düz metin olarak saklıyoruz
  # Bu sadece güvenlik açısından önerilmez, dikkatli olun!
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  has_secure_password

  # Add validation for profile fields if necessary
  validates :personal_information, length: { maximum: 500 }, allow_blank: true
  validates :about_me, length: { maximum: 500 }, allow_blank: true
  validates :education, length: { maximum: 500 }, allow_blank: true
  validates :experience, length: { maximum: 500 }, allow_blank: true
  validates :skills, length: { maximum: 500 }, allow_blank: true


  has_many :posts, dependent: :destroy 
  
end
