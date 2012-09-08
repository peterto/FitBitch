class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      # Twilio fields
      t.string :userid
      t.string :content
      
      t.timestamps
    end
  end
end
