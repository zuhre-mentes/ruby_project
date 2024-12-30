class AddFieldsToPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :category, :string
    add_column :positions, :image_url, :string
    add_column :positions, :salary, :boolean
  end
end
