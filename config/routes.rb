Rails.application.routes.draw do
  devise_for :accounts
  get "u/:username" => "public#profile", as: :profile
  resources :communities do
    resources :posts
  end
  resources :subscriptions
  resources :comments, only: [:create]

  post "post/vote" => "votes#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: "public#index"
end
