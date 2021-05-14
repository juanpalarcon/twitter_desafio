class ChangeAddFriendToFriend < ActiveRecord::Migration[5.2]
  def change
    rename_table :add_friends, :friend
  end
end
