class AddMemeToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :meme_id, :integer
  end
end
