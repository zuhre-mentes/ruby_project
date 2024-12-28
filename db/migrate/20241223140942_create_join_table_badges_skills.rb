class CreateJoinTableBadgesSkills < ActiveRecord::Migration[6.1]
  def change
    create_join_table :badges, :skills do |t|
      t.index [:badge_id, :skill_id] # Performans için index eklenir
      t.index [:skill_id, :badge_id]
    end
  end
end
