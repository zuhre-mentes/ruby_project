class CreateUserEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :user_events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
