Rails.application.routes.draw do
  get "home/index"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  devise_for :users
  
  resources :badges, only: [ :index, :show ]
  resources :verifications, only: [ :new, :create, :show, :index ]
  resources :forum_posts

  get "/verification_success", to: "verifications#success"
  get "/verification_failure", to: "verifications#failure"

  get "up" => "rails/health#show", as: :rails_health_check

  
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  
  root "sessions#new"
  #root "badges#index" - Doğan 

  
  resources :users, only: [ :new, :create, :edit, :update ]

  
  resources :sessions, only: [ :new, :create, :destroy ]
  get "login", to: "sessions#new"
  delete "logout", to: "sessions#destroy", as: "logout"
  get "profile", to: "users#profile", as: "profile"


  
  get "dashboard", to: "home#index"

  get "events/index", to: "events#index", as: "events_index"

  resources :posts, only: [:create]
  resources :posts, only: [:create, :destroy]
  
  resources :badges do
    member do
      get "related"
    end
  end

  get "ai_chat/:id", to: "ai_chat#show", as: "ai_chat"

  namespace :api do
    resources :chat, only: [ :create ]
  end

  
end
