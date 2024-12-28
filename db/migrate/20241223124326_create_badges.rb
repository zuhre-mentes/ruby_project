class CreateBadges < ActiveRecord::Migration[8.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.text :description
      t.references :badge_category, null: false, foreign_key: true
      t.string :issued_by
      t.string :icon_url

      t.timestamps
    end
  end
end
