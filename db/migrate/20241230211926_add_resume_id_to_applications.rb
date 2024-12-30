class AddResumeIdToApplications < ActiveRecord::Migration[7.2]
  def change
    add_reference :applications, :resume, null: false, foreign_key: true
  end
end
