class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :name 
      t.string  :tagline
    end
  end
end
