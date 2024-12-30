class Position < ApplicationRecord
  belongs_to :company
  has_many :applications, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: ["Full Time", "Part Time", "Internship"] }
  validates :application_deadline, presence: true
  validates :location, presence: true

  # Görüntülenme sayısı için varsayılan değer
  attribute :views_count, :integer, default: 0

  # Görüntülenme sayısını artırmak için metod
  def increment_views
    self.views_count = (views_count || 0) + 1
    save
  end

  private

  def notify_users
    User.find_each do |user|
      begin
        Rails.logger.info "Sending notification to #{user.email} for position #{self.title}"
        NotificationMailer.new_position_notification(user, self).deliver_now
        Rails.logger.info "Successfully sent notification to #{user.email}"
      rescue => e
        Rails.logger.error "Failed to send notification to #{user.email}: #{e.message}"
        Rails.logger.error e.backtrace.join("\n")
      end
    end
  end
end
