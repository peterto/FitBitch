FitBitch::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
	get "users/fitbit" => "users#fitbit"
  post "users/fitbit_connect" => "users#fitbit_connect"

  get "users/twitter" => "users#twitter"
	post "users/twitter_connect" => "users#twitter_connect"

  root :to => "home#index"
  match "/home/check_status" => "home#check_status"

  resources :messages
  match "/messages/send_sms" => "messages#send_sms"
  match "/messages/send_email" => "messages#send_email"
  match "/messages/send_email_all" => "messages#send_email_all"

  resources :texts, :emails, :tweets
end
