Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
 resources :projects

 get "chatbot", to: "pages#chatbot"
 root "projects#home"
  
  resources :projects
  resources :tasks, only: [:update]
  patch "project/:id" => "projects#start", as: :project_start #link_to project_start_path(id)



  # Defines the root path route ("/")
  # root "posts#index"

  resources :chats, only: [:show, :create] do
  resources :messages, only: [:new, :create]
  end

end
