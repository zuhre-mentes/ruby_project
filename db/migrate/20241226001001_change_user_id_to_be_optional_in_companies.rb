class ChangeUserIdToBeOptionalInCompanies < ActiveRecord::Migration[7.2]
  def change
    change_column_null :companies, :user_id, true
  end
end
