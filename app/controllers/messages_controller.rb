class MessagesController < ApplicationController

  @multiple = false

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

  def send_email(user=nil, subject=nil, rand_meme_id=nil)
    if user
      subject["FIRST_NAME"] = user.email if subject["FIRST_NAME"]
    else
      user = User.find(params[:user]) unless user
    end

    rand_meme_id = rand(Meme.count)+1 unless rand_meme_id

    Email.new.send_message(user, Meme.find(rand_meme_id), subject)

    if !@multiple
      redirect_to new_message_path
    end
  end

  def send_email_all
    @multiple = true

    rand_meme_id = rand(Meme.count)+1

    User.all.each { |user| 
      send_email(user, "Fitness levels ain't looking so good for FIRST_NAME", rand_meme_id)
    }
    redirect_to new_message_path
  end
end