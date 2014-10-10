class User < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :groups, :through => :memberships
  
  validates :first_name, :presence => true, :if => :persisted?
  
  validates :last_name, :presence => true, :if => :persisted?
   
  validates :company, :presence => true, :if => :persisted?
   
  validates :title, :presence => true, :if => :persisted?
   
  validates :industry, :presence => true, :if => :persisted?
     
  validates :phone, :presence => true, :if => :persisted?
  
        
 attr_accessible :email, :password, :company, :industry, :first_name, :last_name, :title, :phone, :address1, :address2, :city, :state , :zip
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
