class AddApplicationDeadlineToPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :application_deadline, :datetime
  end
end
