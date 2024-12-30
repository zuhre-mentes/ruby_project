class Application < ApplicationRecord
  belongs_to :user
  belongs_to :position
  belongs_to :resume, optional: true

  validates :user_id, presence: true
  validates :position_id, presence: true
  validate :user_has_resume, if: :resume_id_changed?

  def self.ransackable_attributes(auth_object = nil)
    super + %w[id created_at updated_at user_id position_id]
  end

  private

  def user_has_resume
    unless user.resumes.exists?(id: resume_id)
      errors.add(:resume_id, "must be one of your own CVs")
    end
  end
end
