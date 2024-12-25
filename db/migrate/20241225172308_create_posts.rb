class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.boolean :is_event

      t.timestamps
    end
  end
end
