class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string  :name
      t.integer :gathering_id
      t.timestamps null: false
    end
  end
end
