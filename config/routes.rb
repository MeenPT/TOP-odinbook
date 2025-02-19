Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  get "/", to: redirect("/posts")
  resources :posts

  get "up" => "rails/health#show", as: :rails_health_check
end
