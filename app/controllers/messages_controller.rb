class MessagesController < ApplicationController

  def index

  end

  def new

  end

  def send_all
    User.all.each do |user|
      content = "You're a lazy piece of crap. Only #{user.current_steps}?"

      Text.new(
          user_id: user.id,
          content: content
      ).send_message
    end
  end
end