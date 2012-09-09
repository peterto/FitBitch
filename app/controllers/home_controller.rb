class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.where(:user_id => current_user.id).order("created_at DESC")
  end

  def check_status
    if Message.where(:user_id => current_user.id).count > params[:msg_count].to_i
      latest_msg = Message.where(:user_id => current_user.id).last
      if latest_msg.content_id # This is a text message
        content_msg = latest_msg.content.message
        if content_msg["STEPS"]
          content_msg["STEPS"] = current_user.current_steps.to_s
        end
        render :status => 200, :json => {type: "text", msg_content: content_msg, created_at: latest_msg.created_at.in_time_zone("Eastern Time (US & Canada)").strftime("%Y-%m-%d %I:%M%p")}
      else # This is an email meme
        content_msg = latest_msg.meme.subject
        if content_msg["STEPS"]
          content_msg["STEPS"] = current_user.current_steps.to_s
        end
        render :status => 200, :json => {type: "email", subject: content_msg, meme_image_url: latest_msg.meme.image_url, created_at: latest_msg.created_at.in_time_zone("Eastern Time (US & Canada)").strftime("%Y-%m-%d %I:%M%p")}
      end
    else
      render :status => 401, :json => {}
    end
  end

end
