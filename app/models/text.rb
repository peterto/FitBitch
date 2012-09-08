class Text < ActiveRecord::Base
  belongs_to :user

  attr_accessible :userid, :content, :phone_num

  @cfg = YAML.load_file("./config/initializers/api.yml")['twilio']

  @client = Twilio::REST::Client.new(@cfg['account_sid'], @cfg['auth_token'])
  @account = @client.account

  def new
    # user = User.find(text.userid)

    puts 'Testing testing testing '
    twilio = @account.sms.messages.create({
      :from => @cfg['from_phone'],
      :to => :phone_num,
      # :to => '7328581134',
      # :to => User.find(message.userid.phone_num),
      :body => :content
    })

    puts twilio
  end

end