class AddViewsCountToPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :views_count, :integer
  end
end
