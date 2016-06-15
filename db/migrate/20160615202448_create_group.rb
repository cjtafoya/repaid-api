class CreateGroup < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string  :name
      t.integer :event_id
    end
  end
end
