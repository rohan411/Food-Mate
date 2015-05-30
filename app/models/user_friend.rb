class UserFriend < ActiveRecord::Base

 belongs_to :user
 belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"
 
 validates_uniqueness_of :user_id, :scope => [:friend_id]

end