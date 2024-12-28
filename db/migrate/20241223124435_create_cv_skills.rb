class CreateCvSkills < ActiveRecord::Migration[8.0]
  def change
    create_table :cv_skills do |t|
      t.references :cv, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
