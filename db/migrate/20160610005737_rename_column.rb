class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :indexed_activities, :activityId, :activity_id
  end
end
