class Text < ActiveRecord::Base
  belongs_to :user

  attr_accessible :user_id, :content

  @@cfg = YAML.load_file("./config/initializers/api.yml")['twilio']
  @@account = Twilio::REST::Client.new(@@cfg['account_sid'], @@cfg['auth_token']).account

  def send_message
    twilio = @@account.sms.messages.create({
      :from => @@cfg['from_phone'],
      :to => User.find(user_id).phone_number,
      :body => content
    })

    puts twilio
  end

end