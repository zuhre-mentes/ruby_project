class User < ApplicationRecord
  # Include devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :role, inclusion: { in: %w[student academic] }

  # Associations
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :verifications
  has_many :user_badges
  has_many :badges, through: :user_badges
  has_many :cvs
  has_many :posts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :user_events
  has_many :attended_events, through: :user_events, source: :post
  has_many :resumes, dependent: :destroy
end
