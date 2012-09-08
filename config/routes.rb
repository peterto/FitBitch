FitBitch::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
	get "users/fitbit" => "users#fitbit"
  post "users/fitbit_connect" => "users#fitbit_connect"

  root :to => "home#index"

  resources :messages
  match "/messages/send_all" => "messages#send_all"

  resources :texts, :emails, :tweets
end
