Rails.application.routes.draw do
  # Company routes should be defined before user routes to take precedence
  devise_for :companies, controllers: {
    sessions: 'companies/sessions',
    registrations: 'companies/registrations'
  }

  devise_scope :company do
    get '/companies/sign_in', to: 'companies/sessions#new'
    delete '/companies/sign_out', to: 'companies/sessions#destroy'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    root 'users/sessions#new'
  end

  authenticated :user do
    root 'home#index', as: :user_root
  end

  authenticated :company do
    root 'positions#dashboard', as: :company_root
  end

  get 'profile', to: 'users#profile', as: :profile
  get 'dashboard', to: 'home#index', as: :dashboard

  resources :badges, only: [:index, :show] do
    member do
      get "related"
    end
  end

  resources :positions do
    collection do
      get 'dashboard'
    end
    member do
      delete 'remove_image'
    end
    resources :applications, only: [:new, :create]
  end

  resources :verifications, only: [:new, :create, :show, :index]
  resources :forum_posts
  resources :posts, only: [:index, :new, :create, :destroy]

  resources :events, only: [:index, :create, :destroy] do
    member do
      post :join
      delete :leave
    end
  end

  devise_scope :company do
    delete 'companies/remove_logo', to: 'companies/registrations#remove_logo', as: :remove_logo_company
  end

  unauthenticated do
    root 'home#index', as: :unauthenticated_root
  end

  resources :companies do
    member do
      delete :remove_logo
    end
  end

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

  # CV routes
  resources :resumes
  get '/cv', to: 'resumes#index', as: :cv
end
