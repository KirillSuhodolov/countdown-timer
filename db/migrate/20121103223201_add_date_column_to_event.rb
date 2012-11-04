class AddDateColumnToEvent < ActiveRecord::Migration
  def change
    add_column :events, :date_end, :date
  end
end
