class AddTwitterToUser < ActiveRecord::Migration
  def up
  	add_column :users, :twitter_token, :string
  	add_column :users, :twitter_secret, :string
  	add_column :users, :twitter_username, :string
  end

  def down
  	remove_column :users, :twitter_token
  	remove_column :users, :twitter_secret
  	remove_column :users, :twitter_username
  end
end
