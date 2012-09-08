class UsersController < ApplicationController
  def fitbit

  end

  def fitbit_connect
    #client = Fitgem::Client.new(:consumer_key => "608c357377db4e4c8d30dfcdcd7d3621", :consumer_secret => "4e4c5e6798d04fa783ee63c165432484")
    render :fitbit
  end
end
