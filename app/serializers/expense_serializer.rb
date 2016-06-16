class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :amount, :group_id, :attendee_id
  belongs_to :attendee
  belongs_to :group
end
