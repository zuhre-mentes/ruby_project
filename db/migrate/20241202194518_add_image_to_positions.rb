class AddImageToPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :image, :string
  end
end
