class AttendeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :gathering_id, :expense_ids, :group_ids
  belongs_to :gathering
  has_many :expenses
  has_many :groups
end
