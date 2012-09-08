class MessagesController < ApplicationController

    before_filter :init

    def init
        @cfg = YAML.load_file("./config/initializers/api.yml")

        @client = Twilio::REST::Client.new(@cfg['twilio']['account_sid'], @cfg['twilio']['auth_token'])

        @account = @client.account
    end

    def new
      # message = Message.new
      # user = User.find(message.userid)

      twilio_msg = @account.sms.messages.create({
        :from => @cfg['twilio']['from_phone'],
        :to => '7328581134'
        #:to => User.find(message.userid.phone_num)
        })

      puts twilio_msg
    end

end
