class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|

      t.string :user_id
      t.string :content

      t.timestamps
    end
  end
end
