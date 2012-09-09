class Email < ActiveRecord::Base
  include HTTParty
  base_uri "http://fitbitch-api.herokuapp.com"

  belongs_to :user

  def send_message(user, meme)
    response = self.class.post('/email', {
      :body => {
        :to => user.email,
        :subject => meme.subject.sub('STEPS', user.current_steps.to_s),
        :img_url => meme.image_url
      }
    })
    output = JSON.parse(response)

    Message.create(user_id: user.id, meme_id: meme.id) unless output["error"]
  end


end
