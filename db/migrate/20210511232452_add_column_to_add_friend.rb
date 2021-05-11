class AddColumnToAddFriend < ActiveRecord::Migration[5.2]
  def change
    add_column :add_friends, :friend_id, :integer
  end
end
