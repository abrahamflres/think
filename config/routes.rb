Rails.application.routes.draw do
  resources :topics
  devise_for :users

  resources :profiles do
    resources :topics do
      resources :feeds, only: [ :index, :create, :show ]
    end
  end
  get "/profiles/:profile_id/feeds/topic/:topic_id", to: "feeds#index", as: :profile_topic_filtered_feeds



  resources :profiles do
    resources :feeds, only: [ :index, :create ]
    resources :articles do
      resources :comments, only: [ :new, :create ]
      resources :topics
      resources :likes, only: [ :create ]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#landing"
end
