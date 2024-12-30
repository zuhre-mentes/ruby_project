class AddBadgeRequirementsToCompanies < ActiveRecord::Migration[7.2]
  def change
    add_column :companies, :badge_requirements, :text
  end
end
