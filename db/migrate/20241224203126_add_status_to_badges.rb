class AddStatusToBadges < ActiveRecord::Migration[7.2]
  def change
    add_column :badges, :status, :string
  end
end
