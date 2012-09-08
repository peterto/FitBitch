class AddDetailsToUser < ActiveRecord::Migration
  def up
    add_column :users, :phone_number, :string
    add_column :users, :fitbit_token, :string
    add_column :users, :fitbit_user_id, :integer
  end

  def down
    remove_column :users, :phone_number
    remove_column :users, :fitbit_token
    remove_column :users, :fitbit_user_id
  end
end
