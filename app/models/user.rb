class User < ActiveRecord::Base
  has_many :gatherings
end
