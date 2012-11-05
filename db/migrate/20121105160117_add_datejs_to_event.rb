class AddDatejsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :datejs, :string
  end
end
