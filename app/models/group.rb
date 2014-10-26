class Group < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships, :limit => 12
  belongs_to :city
  belongs_to :user
  attr_accessible :name, :city_id, :address, :venue, :time, :description, :time_specific, :rules
  
  validates_presence_of :name, :address, :venue, :description, :time_specific
  
end