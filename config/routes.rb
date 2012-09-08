FitBitch::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  # match "registrations/fitbit" => "registrations#fitbit"
	get "users/fitbit" => "users#fitbit"
  post "users/fitbit_connect" => "users#fitbit_connect"

  root :to => "home#index"
end
