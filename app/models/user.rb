class User < ApplicationRecord
  
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true, inclusion: { in: %w[student academic], message: "%{value} geçerli bir rol değil" }
  validates :name, presence: true

  
  
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  has_secure_password

  
  validates :personal_information, length: { maximum: 500 }, allow_blank: true
  validates :about_me, length: { maximum: 500 }, allow_blank: true
  validates :education, length: { maximum: 500 }, allow_blank: true
  validates :experience, length: { maximum: 500 }, allow_blank: true
  validates :skills, length: { maximum: 500 }, allow_blank: true


  has_many :posts, dependent: :destroy 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_secure_password 
    has_many :user_roles
    has_many :roles, through: :user_roles
    has_many :cvs
    has_many :user_badges
    has_many :badges, through: :user_badges
  
    
    
  
end
