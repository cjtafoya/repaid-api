class AttendeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_id, :expense_ids, :group_ids
end
