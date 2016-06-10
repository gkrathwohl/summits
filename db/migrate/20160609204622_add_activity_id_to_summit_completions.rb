class AddActivityIdToSummitCompletions < ActiveRecord::Migration
  def change
    add_column :summit_completions, :activity_id, :integer
  end
end
