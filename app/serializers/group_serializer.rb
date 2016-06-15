class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_id, :expense_ids, :attendee_ids
end
