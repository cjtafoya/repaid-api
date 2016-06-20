class User < ActiveRecord::Base
  has_many :gatherings
  has_secure_password
end
