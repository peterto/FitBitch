class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|

      t.string :userid
      t.string :content

      t.timestamps
    end
  end
end
