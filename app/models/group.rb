class Group < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships, :limit => 12
  has_one :group_page
  
  attr_accessible :name, :user_id
  
  
  
end
