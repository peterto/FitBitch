class MessagesController < ApplicationController

  def index
  end

  def new
    @users = User.all
  end

  def send_one
    user = User.find(params[:user])

    rand_content_id = rand(Content.count)+1
    rand_meme_id = rand(Meme.count)+1

    Text.new.send_message(user, Content.find(rand_content_id))
    Email.new.send_message(user, Meme.find(rand_meme_id))

    redirect_to new_message_path
  end
end