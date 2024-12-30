class RemoveSalaryFromPositions < ActiveRecord::Migration[7.2]
  def change
    remove_column :positions, :salary, :decimal
  end
end
