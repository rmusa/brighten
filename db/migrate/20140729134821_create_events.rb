class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_picture
      t.datetime :date_time
      t.string :location
      t.integer :number_attending
      t.text :description
      t.string :event_email
    end
  end
end
