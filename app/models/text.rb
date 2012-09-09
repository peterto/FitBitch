class Text < ActiveRecord::Base
  include HTTParty
  base_uri "http://fitbitch-api.herokuapp.com"

  attr_accessible :user_id, :content

  def send_message
    options = {:body => {:to => user_id, :body => content}}
    response = self.class.post('/sms', options)
    logger.info JSON.parse(response.to_json)

    # Based on the response, if its good, we store the message in the message model
  end

end