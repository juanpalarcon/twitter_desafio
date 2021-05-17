class Friend < ApplicationRecord
  belongs_to :user, :class_name => 'User'
  belongs_to :friend, :class_name => 'User'
  
#   def pre_follow
#     current_user.friends.find { |friend| friend.friend_id == tweet.user.id }
#  end
end
