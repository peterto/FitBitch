class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      # Message fields
      t.string :userid
      t.string :content

      t.timestamps
    end
  end
end
