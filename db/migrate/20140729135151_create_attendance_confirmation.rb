class CreateAttendanceConfirmation < ActiveRecord::Migration
  def change
    create_table :attendance_confirmations do |t|
      t.integer :user_id
      t.integer :event_id
    end
  end
end
