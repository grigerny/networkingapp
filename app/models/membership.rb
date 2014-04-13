class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  
  attr_accessible :group_id, :user_id, :status
  validates_uniqueness_of :group_id, :scope => 'user_id'
 
  
  validate :membership_count_within_limit, :on => :create
 

    def membership_count_within_limit
      if self.user.memberships(:reload).count >= 1
        errors.add(:base, "Exceeded thing limit")
      end
    end

end
