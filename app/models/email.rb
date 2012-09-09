class Email < ActiveRecord::Base
  include HTTParty
  base_uri "http://fitbitch-api.herokuapp.com"

  belongs_to :user

  def send_message(user, content)
    sample_message = content.message
    context_message = sample_message.sub(/KEYWORD/, user.current_steps.to_s)

    options = {:body => {:subject => "Hi", :to => user.email, :body_0 => context_message, :body_1 => context_message}}
    response = self.class.post('/email', options)
    output = JSON.parse(response)

    Message.create(user_id: user.id, content_id: content.id) unless output["error"]
  end


end
