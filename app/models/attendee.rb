class Attendee < ActiveRecord::Base
  belongs_to :gathering
  has_many   :expenses
  has_many   :attendee_groups
  has_many   :groups, through: :attendee_groups

  def update_expenses(amount)
    new_total_expenses = (self.total_expenses + amount).round(2)
    self.update(total_expenses: new_total_expenses)
    self.save
  end

  def update_amount_due
    new_amount_due = 0
    self.groups.each do |group|
      new_amount_due += group.amount_per_person
    end
    self.update(amount_due: new_amount_due)
    self.save
  end

  def update_balance
    new_balance = (self.amount_due - self.total_expenses).round(2)
    self.update(balance: new_balance)
    self.save
  end

end
