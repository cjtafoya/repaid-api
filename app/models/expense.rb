class Expense < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :group
end
