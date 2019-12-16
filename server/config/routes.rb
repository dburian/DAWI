Rails.application.routes.draw do
  namespace :admin do
    resources :projects
    resources :architects

    root 'sessions#new'
    get '/home', to: 'administration_pages#home'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'
  get "index" => "pages#index"
  get "project_detail" => "pages#project_detail"
  get "ordered_projects" => "pages#ordered_projects"
  get "contacts" => "pages#contacts"
  get "about_us" => "pages#about_us"
  
  # Mounting api shoudl be somewhere else (like /api)
  # in root we have client pages
  mount API::Base, at: "/"
end
