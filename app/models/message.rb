class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :content

  attr_accessible :user_id, :content_id

end
