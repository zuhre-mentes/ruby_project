class AddPositionTypeToPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :position_type, :string
  end
end
