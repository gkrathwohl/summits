class CreateSummitLists < ActiveRecord::Migration
  def change
    create_table :summit_lists do |t|
      t.string :list_name

      t.timestamps null: false
    end
  end
end
