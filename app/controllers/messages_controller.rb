class MessagesController < ApplicationController

  def index
  end

  def new
    @users = User.all
  end

  def send_sms
    user = User.find(params[:user])

    rand_content_id = rand(Content.count)+1

    Text.new.send_message(user, Content.find(rand_content_id))

    redirect_to new_message_path
  end

  def send_email
    user = User.find(params[:user])

    rand_meme_id = rand(Meme.count)+1

    Email.new.send_message(user, Meme.find(rand_meme_id))

    redirect_to new_message_path
  end
end