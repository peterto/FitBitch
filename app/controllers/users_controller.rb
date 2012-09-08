class UsersController < ApplicationController
  def fitbit
    if params[:oauth_token]
      access_token = client.authorize(session['fitbit_request_token'], session['fitbit_request_secret'], { :oauth_verifier => params[:oauth_verifier] })
      current_user.fitbit_token = access_token.token
      current_user.fitbit_secret = access_token.secret
      current_user.save
    end
  end

  def fitbit_connect
    client = Fitgem::Client.new(:consumer_key => "608c357377db4e4c8d30dfcdcd7d3621", :consumer_secret => "4e4c5e6798d04fa783ee63c165432484")
    request_token = client.request_token
    session['fitbit_request_token'] = request_token.token
    session['fitbit_request_secret'] = request_token.secret

    redirect_to "http://www.fitbit.com/oauth/authorize?oauth_token=#{request_token.token}"
  end
end
