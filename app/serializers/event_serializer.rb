class EventSerializer < ActiveModel::Serializer  
  attributes :id, :name, :tagline, :user_id
end  
