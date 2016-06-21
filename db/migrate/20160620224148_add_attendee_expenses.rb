class AddAttendeeExpenses < ActiveRecord::Migration
  def change
    add_column :attendees, :total_expenses, :float, default: 0.0
    add_column :attendees, :amount_due, :float, default: 0.0
    add_column :attendees, :paid, :float, default: 0.0
    add_column :attendees, :balance, :float, default: 0.0
    add_column :attendees, :reimbursements, :float, default: 0.0
    add_column :attendees, :remaining, :float, default: 0.0
  end
end
