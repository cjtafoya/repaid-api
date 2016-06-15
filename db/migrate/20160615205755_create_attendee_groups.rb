class CreateAttendeeGroups < ActiveRecord::Migration
  def change
    create_table :attendee_groups do |t|
      t.integer :group_id
      t.integer :attendee_id
      t.timestamps null: false
    end
  end
end
