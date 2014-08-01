class RemoveEventPictureFromEvent < ActiveRecord::Migration
  def change
  	remove_column :events, :event_picture
  end
end
