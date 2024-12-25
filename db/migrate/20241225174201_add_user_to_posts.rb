class AddUserToPosts < ActiveRecord::Migration[7.0]
  def change
    # İlk olarak nullable sütun ekle
    add_reference :posts, :user, null: true, foreign_key: true

    # Varsayılan olarak mevcut postlara bir user_id atayın
    Post.reset_column_information
    Post.update_all(user_id: User.first&.id)

    # Son olarak null kısıtlamasını ekle
    change_column_null :posts, :user_id, false
  end
end
