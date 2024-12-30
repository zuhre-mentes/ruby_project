class Application < ApplicationRecord
  belongs_to :user
  belongs_to :position

  def self.ransackable_attributes(auth_object = nil)
    super + %w[id created_at updated_at user_id position_id]
  end
end
