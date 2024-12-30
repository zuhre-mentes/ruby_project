class Position < ApplicationRecord
  belongs_to :company
  has_one_attached :image
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :application_deadline, presence: true

  # Validations
  validates :image, content_type: ['image/png', 'image/jpeg', 'image/jpg'], size: { less_than: 5.megabytes }

  # Görüntülenme sayısı için varsayılan değer
  attribute :views_count, :integer, default: 0

  after_create :notify_users

  # Görüntülenme sayısını artırmak için metod
  def increment_views
    self.views_count = (views_count || 0) + 1
    save
  end

  # Ransackable associations ekleyin
  def self.ransackable_associations(auth_object = nil)
    super + %w[company applications]
  end

  # Ransackable attributes ekleyin
  def self.ransackable_attributes(auth_object = nil)
    super + %w[title description application_deadline]
  end

  private

  def notify_users
    User.find_each do |user|
      NotificationMailer.new_position_notification(user, self).deliver_later
    end
  end
end
