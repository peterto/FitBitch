class TextsController < ApplicationController

    def new

      text = Text.new(
        :user_id => params[:user_id],
        :content => params[:content]
      )

      text.send_message

      render text.to_json

    end

end
