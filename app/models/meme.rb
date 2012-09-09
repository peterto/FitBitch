class Meme < ActiveRecord::Base

  attr_accessible :image_url, :subject

  has_many :messages

end
