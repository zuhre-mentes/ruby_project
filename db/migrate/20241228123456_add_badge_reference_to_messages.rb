class AddBadgeReferenceToMessages < ActiveRecord::Migration[7.2]
  def change
    add_reference :messages, :badge, null: true, foreign_key: true
  end
end 