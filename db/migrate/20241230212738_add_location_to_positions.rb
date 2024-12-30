class AddLocationToPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :location, :string
  end
end
