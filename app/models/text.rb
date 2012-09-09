class Text < ActiveRecord::Base
  include HTTParty
  base_uri "http://fitbitch-api.herokuapp.com"

  def send_message(user, content)
    message = content.message
    if message["STEPS"]
      message["STEPS"] = user.current_steps.to_s
    end
      
    response = self.class.post('/sms', {
      :body => {
        :to => user.phone_number,
        :body => message
      }
    })
    output = JSON.parse(response)

    Message.create(user_id: user.id, content_id: content.id) unless output["error"]
  end

end