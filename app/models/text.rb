class Text < ActiveRecord::Base
  include HTTParty
  base_uri "http://fitbitch-api.herokuapp.com"

  def send_message(user, content)
    sample_message = content.message
    context_message = sample_message.sub('STEPS', user.current_steps.to_s)

    options = {:body => {:to => user.phone_number, :body => context_message}}
    response = self.class.post('/sms', options)
    output = JSON.parse(response)

    Message.create(user_id: user.id, content_id: content.id) unless output["error"]
  end

end