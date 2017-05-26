class AddActivityNameToClimbRecord < ActiveRecord::Migration
  def change
    add_column :climb_records, :activity_name, :string
  end
end
