class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string  :name
      t.string  :description
      t.integer :amount
      t.integer :group_id
      t.integer :attendee_id
      t.timestamps null: false
    end
  end
end
