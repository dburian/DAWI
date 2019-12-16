Rails.application.routes.draw do
  namespace :admin do
    resources :projects
    resources :architects

    root 'sessions#new'
    get '/home', to: 'administration_pages#home'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'


    get '*unmatched_route', to: 'sessions#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
