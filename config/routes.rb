FitBitch::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
	get "users/fitbit" => "users#fitbit"
  post "users/fitbit_connect" => "users#fitbit_connect"

  root :to => "home#index"
  match "/home/check_status" => "home#check_status"

  resources :messages
  match "/messages/send_sms" => "messages#send_sms"
  match "/messages/send_email" => "messages#send_email"

  resources :texts, :emails, :tweets
end
