class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :amount, :group_id, :attendee_id
end
