class AddCvToApplications < ActiveRecord::Migration[7.2]
  def change
    add_reference :applications, :cv, null: false, foreign_key: true
  end
end
