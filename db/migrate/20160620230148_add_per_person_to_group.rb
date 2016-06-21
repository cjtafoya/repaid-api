class AddPerPersonToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :amount_per_person, :float, default: 0.0
  end
end
