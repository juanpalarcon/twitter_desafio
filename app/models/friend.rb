class AddFriend < ApplicationRecord
  belongs_to :user
  
  def pre_follow
    current_user.friends.find { |friend| friend.friend_id == tweet.user.id }
 end
end
