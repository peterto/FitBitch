class AddFitbitInfoToUsers < ActiveRecord::Migration
  def up
    add_column :users, :fitbit_token, :string
    add_column :users, :fitbit_secret, :string
  end

  def down

  end
end
