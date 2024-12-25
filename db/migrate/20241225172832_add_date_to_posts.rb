class AddDateToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :date, :datetime
  end
end
