class CreateSummits < ActiveRecord::Migration
  def change
    create_table :summits do |t|
      t.integer :osm_id
      t.string :name
      t.integer :elevation
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
