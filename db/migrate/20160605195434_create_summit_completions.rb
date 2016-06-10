class CreateSummitCompletions < ActiveRecord::Migration
  def change
    create_table :summit_completions do |t|
      t.string :summit
      t.integer :userId

      t.timestamps null: false
    end
  end
end
