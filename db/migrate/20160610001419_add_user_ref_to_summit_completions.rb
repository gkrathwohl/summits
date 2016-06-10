class AddUserRefToSummitCompletions < ActiveRecord::Migration
  def change
    add_reference :summit_completions, :user, index: true, foreign_key: true
  end
end
