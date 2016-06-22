class Group < ActiveRecord::Base
  belongs_to :gathering
  has_many   :expenses
  has_many   :attendee_groups
  has_many   :attendees, through: :attendee_groups

  def update_expense_per_person
    total_group_expenses = self.expenses.sum(:amount)
    new_amount_per_person = (total_group_expenses / self.attendees.length).round(2)
    self.update(amount_per_person: new_amount_per_person)
    self.save
  end
  
  def update_attendee_balances
    self.attendees.each do |attendee|
      attendee.update_amount_due
      attendee.update_balance
    end
  end
end
