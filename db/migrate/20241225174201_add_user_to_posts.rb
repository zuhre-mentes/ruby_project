class AddUserToPosts < ActiveRecord::Migration[7.0]
  def change
    # 1. user_id sütununu nullable olarak ekle
    add_reference :posts, :user, null: true, foreign_key: true

    # 2. Null kısıtlamasını ayrı bir migration veya veritabanı düzeyinde yönet
    reversible do |dir|
      dir.up do
        # Tüm mevcut postlara varsayılan bir kullanıcı ID'si ata
        default_user_id = User.first&.id || 1 # Eğer bir kullanıcı yoksa ID 1 gibi sabit bir değer atanabilir
        execute("UPDATE posts SET user_id = #{default_user_id}")
      end
    end

    # 3. Null kısıtlamasını aktif et
    change_column_null :posts, :user_id, false
  end
end