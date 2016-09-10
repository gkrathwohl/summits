class AddStravaIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :strava_id, :int
  end
end
