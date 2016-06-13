class CreateSummitInLists < ActiveRecord::Migration
  def change
    create_table :summit_in_lists do |t|
      t.references :summit, index: true, foreign_key: true
      t.references :summit_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
