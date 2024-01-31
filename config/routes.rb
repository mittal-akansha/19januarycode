Rails.application.routes.draw do
  get 'rooms/index'
  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users
  resources :user_posts do 
    resources :comments
  end 
  get '/u/:id', to: "users#profile"
  root 'pages#home'
  get 'about',to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :rooms do
    resources :messages
  end
end
