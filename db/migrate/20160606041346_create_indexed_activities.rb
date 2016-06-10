class CreateIndexedActivities < ActiveRecord::Migration
  def change
    create_table :indexed_activities do |t|
      t.integer :userId
      t.integer :activityId

      t.timestamps null: false
    end
  end
end
