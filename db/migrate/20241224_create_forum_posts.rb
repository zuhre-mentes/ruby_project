class CreateForumPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :forum_posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :author_name, null: false
      t.string :category, null: false
      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0

      t.timestamps
    end

    add_index :forum_posts, :category
  end
end
