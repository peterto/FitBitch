class AddInfoToMemes < ActiveRecord::Migration
  def up
    add_column :memes, :image_url, :string
    add_column :memes, :subject, :string
  end

  def down
    remove_column :memes, :image_url
    remove_column :memes, :subject
  end
end
