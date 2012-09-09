class Email < ActiveRecord::Base
  include HTTParty
  base_uri "http://fitbitch-api.herokuapp.com"

  def send_message(user, meme, subject=nil)
    subject = meme.subject
    if subject["STEPS"]
      subject["STEPS"] = user.current_steps.to_s
    end

    response = self.class.post('/email', {
      :body => {
        :to => user.email,
        :subject => subject,
        :img_url => meme.image_url
      }
    })
    output = JSON.parse(response)

    Message.create(user_id: user.id, meme_id: meme.id) unless output["error"]
  end


end
