class User < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name
  has_many :places
  has_many :trips
end
