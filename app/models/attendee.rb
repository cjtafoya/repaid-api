class Attendee < ActiveRecord::Base
  belongs_to :gathering
  has_many   :expenses
  has_many   :attendee_groups
  has_many   :groups, through: :attendee_groups

  def update_self_expenses(amount)
    new_total_expenses = self.total_expenses + amount 
    self.update(total_expenses: new_total_expenses) 
    self.save
  end

  def update_all(amount)
    new_amount_due = 0
    self.groups.each do |group|
      new_amount_due += group.amount_per_person
    end

    new_balance = (new_amount_due - self.total_expenses)
    self.update(amount_due: (new_amount_due).round(2), balance: (new_balance).round(2))
    self.save
  end

  def update_balance(expense)
    x = self.amount_due - expense
    self.update(balance: (x).round(2))
    self.save
  end
end
