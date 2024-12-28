class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :role, null: false

      t.timestamps
    end

    # Add an index for email to make lookups faster
    add_index :users, :email, unique: true
  end
end
