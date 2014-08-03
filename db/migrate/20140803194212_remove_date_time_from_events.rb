class RemoveDateTimeFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :date_time
  end
end
