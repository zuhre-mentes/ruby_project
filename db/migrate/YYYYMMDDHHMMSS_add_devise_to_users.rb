class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def up
    # Drop existing users table if exists
    drop_table :users if table_exists?(:users)
    
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name,              null: false, default: ""
      t.string :role,              null: false, default: "student"

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## User specific fields
      t.text :personal_information
      t.text :about_me
      t.text :education
      t.text :experience
      t.text :skills

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end

  def down
    drop_table :users
  end
end 