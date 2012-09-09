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
    user = User.find(params[:user]) unless user
    logger.info(user)
    puts user.inspect
    puts user.email
    puts user.current_steps

    if subject.to_s["FIRST_NAME"]
      subject["FIRST_NAME"] = user.email
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

  def send_email_pete
    send_email(
      User.where(:email => 'pt9386@gmail.com')[0],
      nil,
      Meme.where(:image_url => 'http://cdn.memegenerator.net/instances/400x/26423750.jpg')[0]
    )
  end
end