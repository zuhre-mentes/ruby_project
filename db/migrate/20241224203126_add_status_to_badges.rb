class AddStatusToBadges < ActiveRecord::Migration[8.0]
  def change
    add_column :badges, :status, :string
  end
end
