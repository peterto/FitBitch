class AddMessageToContents < ActiveRecord::Migration
  def change
    add_column :contents, :message, :string
  end
end
