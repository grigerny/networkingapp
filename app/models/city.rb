class City < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships, :limit => 12
  has_many :groups
  
  attr_accessible :name, :user_id
  
end
