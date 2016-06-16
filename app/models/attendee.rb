class Attendee < ActiveRecord::Base
  belongs_to :gathering
  has_many   :expenses
  has_many   :attendee_groups
  has_many   :groups, through: :attendee_groups
end
