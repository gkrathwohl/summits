class FixColumns < ActiveRecord::Migration
  def change
    remove_column :summit_completions, :userId, :integer
    remove_column :indexed_activities, :userId, :integer 
    add_reference :indexed_activities, :user, index: true, foreign_key: true   
  end
end
