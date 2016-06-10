class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :businesses, :users
    add_foreign_key :businesses, :users
  end
end
