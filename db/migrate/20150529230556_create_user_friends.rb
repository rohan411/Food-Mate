class CreateUserFriends < ActiveRecord::Migration
  def change
    create_table :user_friends do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :percentage
      t.boolean :is_new_match
      t.timestamps
    end
  end
end
