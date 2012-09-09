class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :content
  belongs_to :meme

  attr_accessible :user_id, :content_id, :meme_id

end
