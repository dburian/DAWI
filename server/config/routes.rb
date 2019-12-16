Rails.application.routes.draw do
  namespace :admin do
    resources :projects
    resources :architects
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount API::Base, at: "/"
end
