class RemoveDatetimeColumnFromEvent < ActiveRecord::Migration
  def change
  	remove_column :events, :datetime_end
  end
end
