class TextsController < ApplicationController

    before_filter :init

    def init
        @cfg = YAML.load_file("./config/initializers/api.yml")['twilio']

        @client = Twilio::REST::Client.new(@cfg['account_sid'], @cfg['auth_token'])
        @account = @client.account
    end

    def new
      # text = Text.new
      # user = User.find(text.userid)

      twilio = @account.sms.messages.create({
        :from => @cfg['from_phone'],
        :to => '7328581134',
        #:to => User.find(message.userid.phone_num),
        :body => 'Test message, bitch'
        })

      puts twilio
     
    end

end
