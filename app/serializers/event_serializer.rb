class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :tagline, :user_id, :attendee_ids, :group_ids
end
