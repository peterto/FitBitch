class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.where(:user_id => current_user.id)
  end

  def check_status
    if Message.where(:user_id => current_user.id).count > params[:msg_count].to_i
      latest_msg = Message.where(:user_id => current_user.id).last
      render :status => 200, :json => {msg_content: latest_msg.content.message}
    else
      render :status => 401, :json => {}
    end
  end

end
