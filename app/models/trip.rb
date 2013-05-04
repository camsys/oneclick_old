class Trip < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :owner, foreign_key: 'user_id', class_name: User
end
