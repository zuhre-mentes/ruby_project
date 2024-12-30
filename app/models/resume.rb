class Resume < ApplicationRecord
  belongs_to :user
  has_one_attached :pdf_file
  
  validates :title, presence: true
  validates :description, presence: true
  validates :pdf_file, presence: true
  validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if pdf_file.attached? && !pdf_file.content_type.in?(%w(application/pdf))
      errors.add(:pdf_file, 'must be a PDF file')
    end
  end
end
