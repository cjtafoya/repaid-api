class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_id, :expense_ids, :attendee_ids
  belongs_to :event
  has_many :expenses
  has_many :attendees
end
