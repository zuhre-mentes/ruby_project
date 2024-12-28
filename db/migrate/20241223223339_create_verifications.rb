class CreateVerifications < ActiveRecord::Migration[7.2]
  def change
    create_table :verifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true
      t.string :status, default: 'pending'
      
      t.timestamps
    end
  end
end
