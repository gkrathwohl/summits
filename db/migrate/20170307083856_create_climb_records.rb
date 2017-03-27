class CreateClimbRecords < ActiveRecord::Migration
  def change
    create_table :climb_records do |t|
      t.decimal :elevation_gain
      t.integer :activity_id
      t.integer :start_time
      t.integer :end_time
      t.integer :total_time
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
