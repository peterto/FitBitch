class MessagesController < ApplicationController

  def index
  end

  def new
  end

  def send_all
    User.all.each do |user|
      rand_id = rand(Content.count)+1
      sample_message = Content.find(rand_id).message
      context_message = sample_message.sub(/KEYWORD/, user.current_steps.to_s)

      Text.new(
          user_id: user.id,
          content: context_message
      ).send_message

      redirect_to :new
    end
  end
end