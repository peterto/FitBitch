class Content < ActiveRecord::Base

  attr_accessible :message

  has_many :messages

end
