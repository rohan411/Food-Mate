class AddMatchedUsersColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :matched_users, :text
  end
end
