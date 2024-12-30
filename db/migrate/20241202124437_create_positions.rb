class CreatePositions < ActiveRecord::Migration[7.2]
  def change
    create_table :positions do |t|
      t.string :title
      t.text :description
      t.text :badge_requirements
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
