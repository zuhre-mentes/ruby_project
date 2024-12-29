class AddDescriptionToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :description, :string
  end
end
