class AddDetailsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :user_id, :integer
    add_column :messages, :content_id, :integer
  end
end
