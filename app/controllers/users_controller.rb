class UsersController < ApplicationController
  def fitbit
    if params[:oauth_token]
      client = Fitgem::Client.new(:consumer_key => ENV['FITBIT_CONSUMER_KEY'], :consumer_secret => ENV['FITBIT_CONSUMER_SECRET'])
      access_token = client.authorize(session['fitbit_request_token'], session['fitbit_request_secret'], { :oauth_verifier => params[:oauth_verifier] })

      current_user.fitbit_token = access_token.token
      current_user.fitbit_secret = access_token.secret

      client.reconnect(access_token.token, access_token.secret)
      steps_data = client.data_by_time_range('/activities/log/steps', {:base_date => (Date.today - 1.day).strftime('%Y-%m-%d'), :period => "1d"})
      logger.info steps_data
      number_of_steps = steps_data["activities-log-steps"][0]["value"].to_i
      logger.info number_of_steps
      current_user.current_steps = number_of_steps

      current_user.save
    end
  end

  def fitbit_connect
    client = Fitgem::Client.new(:consumer_key => ENV['FITBIT_CONSUMER_KEY'], :consumer_secret => ENV['FITBIT_CONSUMER_SECRET'])
    request_token = client.request_token
    session['fitbit_request_token'] = request_token.token
    session['fitbit_request_secret'] = request_token.secret

    redirect_to "http://www.fitbit.com/oauth/authorize?oauth_token=#{request_token.token}"
  end

  def twitter
    @consumer = OAuth::Consumer.new( ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_CONSUMER_SECRET"], {
      :site => "https://api.twitter.com"
    })

    @request_token = @consumer.get_request_token
    
    # p @request_token.get_access_token

    session[:request_token] = @request_token
    redirect_to @request_token.authorize_url

    # @access_token = @request_token.get_access_token
    
    # current_user.twitter_token = @access_token.token 
    # current_user.twitter_secret = @access_token.secret

    # session[:request_token] = @request_token


    current_user.save
  end

  def twitter_connect

  end
end
