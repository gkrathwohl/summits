class AddDateToSummitCompletions < ActiveRecord::Migration
  def change
    add_column :summit_completions, :date, :timestamp
  end
end
