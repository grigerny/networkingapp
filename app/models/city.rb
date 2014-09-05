class City < ActiveRecord::Base
  has_many :groups
  attr_accessible :name, :user_id
  
end
