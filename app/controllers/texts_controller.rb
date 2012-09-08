class TextsController < ApplicationController

    def new

      text = Text.new(
        :content => params[:content],
        :phone_num => params[:phone_num]
      )

    end

end
