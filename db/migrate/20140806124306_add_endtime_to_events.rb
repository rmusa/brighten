class AddEndtimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :endtime, :time
  end
end
