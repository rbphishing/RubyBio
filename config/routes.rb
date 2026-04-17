Rails.application.routes.draw do
  # AUTH
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/register", to: "users#new"
  post "/users", to: "users#create"

  # LINKS (CRUD COMPLETO)
  resources :links do
    member do
      post :fetch_icon
    end
  end

  # REDIRECT TRACKING
  get "/l/:id", to: "links#redirect"

  # PÁGINA PÚBLICA (SEMPRE POR ÚLTIMO)
  get "/:username", to: "public#show"

  # ROOT
  root "sessions#new"

  # HEALTH CHECK
  get "up" => "rails/health#show", as: :rails_health_check
end