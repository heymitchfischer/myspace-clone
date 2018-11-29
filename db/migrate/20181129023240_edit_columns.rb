class EditColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_id
    remove_column :users, :friend_id
    add_column :friend_requests, :user_id, :integer
    add_column :friend_requests, :friend_id, :integer
  end
end
