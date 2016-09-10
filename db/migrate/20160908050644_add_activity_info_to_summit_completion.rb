class AddActivityInfoToSummitCompletion < ActiveRecord::Migration
  def change
    add_column :summit_completions, :activity_name, :string
  end
end
