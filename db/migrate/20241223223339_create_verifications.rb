class CreateVerifications < ActiveRecord::Migration[6.1]
  has_one_attached :file

  # Enum için hali hazırda mevcut
  enum status: { uploaded: 0, in_progress: 1, verified: 2 }

  validates :file, presence: true
end
