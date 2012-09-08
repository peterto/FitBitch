class MessagesController < ApplicationController

    before_filter :init

    def init
        @cfg = YAML.load_file("#{RAILS_ROOT}/config/initializers/api.yml")[RAILS_ENV]
        @client = Twilio::REST::Client.new(@cfg['twilio']['account_sid'], @cfg['twilio']['auth_token'])

        @account = @client.account
    end

    def new
        message = @account.sms.messages.create({:from => '+18482072726'})
        puts message
    end

end
