class AttendeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_id, :expense_ids, :group_ids
  belongs_to :event
  has_many :expenses
  has_many :groups
end
