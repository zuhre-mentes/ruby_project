Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    root 'users/sessions#new'
  end

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  get 'profile', to: 'home#profile', as: :profile
  get 'dashboard', to: 'home#index', as: :dashboard

  resources :badges, only: [:index, :show] do
    member do
      get "related"
    end
  end

  resources :verifications, only: [:new, :create, :show, :index]
  resources :forum_posts
  resources :posts, only: [:create, :destroy]

  get "/verification_success", to: "verifications#success"
  get "/verification_failure", to: "verifications#failure"

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :users, only: [:new, :create, :edit, :update]

  get "events/index", to: "events#index", as: "events_index"

  get "ai_chat/:id", to: "ai_chat#show", as: "ai_chat"

  namespace :api do
    resources :chat, only: [ :create ]
  end

  resources :ai_chat, only: [:show]
end
