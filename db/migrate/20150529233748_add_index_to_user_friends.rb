class AddIndexToUserFriends < ActiveRecord::Migration
  def change
    add_index :user_friends, [:user_id, :friend_id]
  end
end