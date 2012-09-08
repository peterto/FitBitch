class AddCurrentStepsToUser < ActiveRecord::Migration
  def up
    add_column :users, :current_steps, :integer
  end

  def down
    remove_column :users, :current_steps
  end
end

