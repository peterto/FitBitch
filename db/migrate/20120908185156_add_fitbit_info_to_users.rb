class AddFitbitInfoToUsers < ActiveRecord::Migration
  def up
    add_column :users, :fitbit_secret, :string
  end

  def down
    remove_column :users, :fitbit_secret, :string
  end
end
