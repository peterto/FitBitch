class MessagesController < ApplicationController

  def index
  end

  def new
  end

  def send_all
    User.all.each do |user|
      offset = rand(User.count)
      sample_message = Content.find(:offset => offset).message
      context_message = sample_message.sub(/KEYWORD/, user.current_steps)

      Text.new(
          user_id: user.id,
          content: context_message
      ).send_message
    end
  end
end