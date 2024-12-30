class ChangeApplicationsCvIdToNullable < ActiveRecord::Migration[7.2]
  def change
    change_column_null :applications, :cv_id, true
  end
end
