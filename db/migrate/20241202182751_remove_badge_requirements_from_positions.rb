class RemoveBadgeRequirementsFromPositions < ActiveRecord::Migration[7.2]
  def change
    remove_column :positions, :badge_requirements, :text
  end
end
