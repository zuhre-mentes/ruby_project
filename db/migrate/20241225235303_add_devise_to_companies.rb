# frozen_string_literal: true

class AddDeviseToCompanies < ActiveRecord::Migration[7.2]
  def self.up
    # Önce email sütununu ekleyin
    add_column :companies, :email, :string, null: false, default: ""

    # Daha sonra tekrarlayan email değerlerini temizleyin (eğer varsa)
    Company.group(:email).having("count(email) > 1").pluck(:email).each do |email|
      Company.where(email: email).offset(1).destroy_all
    end

    # Benzersizliği sağlamak için email sütununa index ekleyin
    add_index :companies, :email, unique: true

    # Diğer devise alanlarını ekleyin
    change_table :companies, bulk: true do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      # Devise'in diğer alanlarını eklemek istiyorsanız yorum satırlarını kaldırabilirsiniz
    end

    add_index :companies, :reset_password_token, unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end


