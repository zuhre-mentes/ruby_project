class CreateResumes < ActiveRecord::Migration[7.2]
  def change
    create_table :resumes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
