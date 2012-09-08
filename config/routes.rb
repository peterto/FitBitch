FitBitch::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  # match "registrations/fitbit" => "registrations#fitbit"
	match "users/fitbit" => "users#fitbit"


  root :to => "home#index"
end
