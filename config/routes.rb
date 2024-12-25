Rails.application.routes.draw do
  get "home/index"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"

  # Sağlık durumu kontrolü
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA rotaları
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Kök rota - kayıt ekranı
  root "sessions#new"

  # Kullanıcı rotaları (kayıt, düzenleme ve güncelleme dahil)
  resources :users, only: [ :new, :create, :edit, :update ]

  # Oturum (log in & log out) rotaları
  resources :sessions, only: [ :new, :create, :destroy ]
  get "login", to: "sessions#new"
  delete "logout", to: "sessions#destroy", as: "logout"
  get "profile", to: "users#profile", as: "profile"


  # Giriş sonrası ana sayfa
  get "dashboard", to: "home#index"

  get "events/index", to: "events#index", as: "events_index"

  resources :posts, only: [:create]
  resources :posts, only: [:create, :destroy]

  
end
