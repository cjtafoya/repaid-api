class ChangeAmountToFloat < ActiveRecord::Migration
  def change
    change_column :expenses, :amount, :float
  end
end
