class AddBadgeRequirementsToPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :badge_requirements, :text
  end
end
