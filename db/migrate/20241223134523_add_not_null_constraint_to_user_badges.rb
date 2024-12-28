class AddNotNullConstraintToUserBadges < ActiveRecord::Migration[6.1]
  def change
    change_column_null :user_badges, :user_id, false
    change_column_null :user_badges, :badge_id, false
  end
end
