class AddProfileDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :personal_information, :text
    add_column :users, :about_me, :text
    add_column :users, :education, :text
    add_column :users, :experience, :text
    add_column :users, :skills, :text
  end
end
