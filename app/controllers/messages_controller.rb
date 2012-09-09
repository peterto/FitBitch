class MessagesController < ApplicationController

  def index
  end

  def new
  end

  def send_all
    User.all.each do |user|
      rand_id = rand(Content.count)+1

      Text.new.send_message(user, Content.find(rand_id))

    end
    redirect_to new_message_path
  end
end