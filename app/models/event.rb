class Event < ActiveRecord::Base
  belongs_to :user
  has_many   :attendees
  has_many   :groups
  has_many   :expenses, through: :groups
end
