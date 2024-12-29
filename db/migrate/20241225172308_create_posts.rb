class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.boolean :is_event, default: false
      t.datetime :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end