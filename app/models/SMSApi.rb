class SMSApi < ActiveRecord::Base
  include 'HTTParty'
  base_uri "http://fitbitch-api.herokuapp.com/sms"

  attr_accessible :user_id, :content

  @@account = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'] ).account

  def send_message
    response = self.class.post('/', :query => {:to => User.find(user_id).phone_number, :body => content})
    logger.info JSON.parse(response)

    #request = HTTParty.get('http://fitbitch-api.herokuapp.com/text' +
    #  '/to/' + User.find(user_id).phone_number +
    #  '/body/' + content
    #)
  end

end