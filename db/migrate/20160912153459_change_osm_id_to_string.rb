class ChangeOsmIdToString < ActiveRecord::Migration
  def change
    change_column :Summits, :osm_id,  :string
  end
end
