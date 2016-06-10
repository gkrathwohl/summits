class AddSummitInfoToSummitCompletions < ActiveRecord::Migration
  def change
    add_column :summit_completions, :osm_summit_id, :integer
    add_column :summit_completions, :osm_summit_elevation, :integer
    add_column :summit_completions, :osm_summit_lat, :float
    add_column :summit_completions, :osm_summit_lon, :float
  end
end
