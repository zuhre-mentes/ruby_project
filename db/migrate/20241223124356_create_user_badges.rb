class CreateUserBadges < ActiveRecord::Migration[8.0]
  def change
    create_table :user_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true
      t.datetime :awarded_at

      t.timestamps
    end
  end
end
