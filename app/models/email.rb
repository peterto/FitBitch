class Email < ActiveRecord::Base
  include HTTParty
  belongs_to :user

  attr_accessible :user_id, :content

  def send_all
    # Send email to everyone in the database
    request = HTTParty.get('http://fitbitch-api.herokuapp.com/email' +
      '/to/' + User.find(user_id).phone_number +
      '/body/' + content
    )
  end
end
