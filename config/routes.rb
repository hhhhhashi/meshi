Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  root to: "homes#top"

  devise_for :users

  resources :post_images, only: [:new, :index, :show, :create, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  get "/homes/about" => "homes#about", as: "about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
