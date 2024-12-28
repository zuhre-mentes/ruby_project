class AddImageUrlToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :image_url, :string
  end
end
