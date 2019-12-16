Rails.application.routes.draw do
  namespace :admin do
    resources :projects
    resources :architects
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'
  get "index" => "pages#index"
  get "project_detail" => "pages#project_detail"
  get "ordered_projects" => "pages#ordered_projects"
  get "contacts" => "pages#contacts"
  get "about_us" => "pages#about_us"
  
  mount API::Base, at: "/"
end
