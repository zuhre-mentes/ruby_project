class Verification < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  has_many_attached :files

  validates :user_id, presence: true
  validates :badge_id, presence: true
  validates :files, presence: true
  validate :file_type_validation
  validate :file_count_validation

  private

  def file_type_validation
    return unless files.attached?

    files.each do |file|
      unless file.content_type == "application/pdf"
        errors.add(:files, "sadece PDF dosyaları kabul edilmektedir")
      end
    end
  end

  def file_count_validation
    return unless files.attached?

    if files.length > 3
      errors.add(:files, "en fazla 3 dosya yükleyebilirsiniz")
    end
  end
end
