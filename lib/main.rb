require 'dotenv/load'
require 'mail'

# SMTP Ayarları ve Mail Gönderme
Mail.defaults do
  delivery_method :smtp, {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'gmail.com',
    user_name: ENV['SMTP_EMAIL'],
    password: ENV['SMTP_PASSWORD'],
    authentication: 'plain',
    enable_starttls_auto: true
  }
end

mail = Mail.new do
  from ENV['SMTP_EMAIL']
  to current_user.email
  subject 'Başvurunuz Alınmıştır'
  body 'Sayın [Ad Soyad], başvurunuz alınmıştır. Teşekkür ederiz.'
end

mail.deliver!
puts 'Başvuru maili gönderildi.'
