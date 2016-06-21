class Group < ActiveRecord::Base
  belongs_to :gathering
  has_many   :expenses
  has_many   :attendee_groups
  has_many   :attendees, through: :attendee_groups

  def update_all(amount)
    attendees = self.attendees
    new_amount_per_person = self.amount_per_person += (amount / attendees.length)
    self.update(amount_per_person: new_amount_per_person)
    self.save
    
    attendees.each do |attendee| 
      attendee.update_all(self.amount_per_person)
    end    
  end
end
