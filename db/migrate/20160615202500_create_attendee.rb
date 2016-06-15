class CreateAttendee < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string  :name
      t.integer :event_id
    end
  end
end
