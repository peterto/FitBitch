class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|

      t.string :userid
      t.string :content
      t.string :phone_num

      t.timestamps
    end
  end
end
