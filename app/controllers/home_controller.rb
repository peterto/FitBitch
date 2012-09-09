class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.where(:user_id => current_user.id).order("created_at DESC")
  end

  def check_status
    if Message.where(:user_id => current_user.id).count > params[:msg_count].to_i
      latest_msg = Message.where(:user_id => current_user.id).last
      if latest_msg.content_id # This is a text message
        render :status => 200, :json => {type: "text", msg_content: latest_msg.content.message, created_at: latest_msg.created_at.in_time_zone("Eastern Time (US & Canada)").strftime("%Y-%m-%d %I:%M%p")}
      else # This is an email meme
        render :status => 200, :json => {type: "email", subject: latest_msg.meme.subject, meme_image_url: latest_msg.meme.image_url, created_at: latest_msg.created_at.in_time_zone("Eastern Time (US & Canada)").strftime("%Y-%m-%d %I:%M%p")}
      end
    else
      render :status => 401, :json => {}
    end
  end

end
