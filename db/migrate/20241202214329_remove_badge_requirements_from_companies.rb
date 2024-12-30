class RemoveBadgeRequirementsFromCompanies < ActiveRecord::Migration[7.2]
  def change
    remove_column :companies, :badge_requirements, :string
  end
end
