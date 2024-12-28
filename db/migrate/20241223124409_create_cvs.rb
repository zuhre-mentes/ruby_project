class CreateCvs < ActiveRecord::Migration[8.0]
  def change
    create_table :cvs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :file_path
      t.datetime :uploaded_at
      t.string :status

      t.timestamps
    end
  end
end
