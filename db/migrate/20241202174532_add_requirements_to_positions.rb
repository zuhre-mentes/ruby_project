class AddRequirementsToPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :requirements, :text
  end
end
