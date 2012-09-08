FitBitch::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  match "registrations/fitbit" => "registrations#fitbit"

  root :to => "home#index"
end
