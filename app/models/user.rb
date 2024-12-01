class User < ApplicationRecord
  # Doğrulamalar
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :role, presence: true, inclusion: { in: %w[student academic], message: "%{value} geçerli bir rol değil" }

  # Şifreyi düz metin olarak saklıyoruz
  # Bu sadece güvenlik açısından önerilmez, dikkatli olun!
  validates :password, presence: true, length: { minimum: 6 }

  # password_digest ve confirmation burada kullanılmıyor
  attr_accessor :password_confirmation
end
