class Text < ActiveRecord::Base
  # include HTTParty
  belongs_to :user

  attr_accessible :user_id, :content

  # @@cfg = YAML.load_file("./config/initializers/api.yml")['twilio']
  # @@account = Twilio::REST::Client.new(@@cfg['account_sid'], @@cfg['auth_token']).account

  @@account = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'] ).account


  def send_message

    request = HTTParty.get('http://fitbitch-api.herokuapp.com/text' +
      '/to/' + User.find(user_id).phone_number +
      '/body/' + content
    )
    # twilio = @@account.sms.messages.create({
    #   :from => ENV['TWILIO_PHONE_NUMBER'],
    #   :to => User.find(user_id).phone_number,
    #   :body => content
    # })

    # puts twilio
  end

end