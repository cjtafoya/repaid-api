class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :gathering_id, :expense_ids, :attendee_ids
  belongs_to :gathering
  has_many :expenses
  has_many :attendees
end
