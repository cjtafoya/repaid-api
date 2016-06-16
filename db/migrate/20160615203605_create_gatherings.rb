class CreateGatherings < ActiveRecord::Migration
  def change
    create_table :gatherings do |t|
      t.string  :name
      t.string  :tagline
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
