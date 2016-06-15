class Group < ActiveRecord::Base
  belongs_to :event
  has_many   :expenses
  has_many   :attendee_groups
  has_many   :attendees, through: :attendee_groups
end
