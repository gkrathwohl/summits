class ChangeSummitIdIntSize < ActiveRecord::Migration
  def change
    change_column :summit_completions, :osm_summit_id, :integer, :limit => 8
  end
end
