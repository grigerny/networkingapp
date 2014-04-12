class User < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :groups, :through => :memberships
  

        
 attr_accessible :email, :password, :company, :industry, :first_name, :last_name, :phone, :address1, :address2, :city, :state, :zip
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
