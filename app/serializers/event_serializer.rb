class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :tagline, :user_id, :attendee_ids, :group_ids
  has_many :attendees
  has_many :groups
  belongs_to :user
end
