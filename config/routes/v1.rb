namespace :v1 do
  get "health", to: "pages#health"
  get "test", to: "pages#index"
  post "auth", to: "sessions#create"
  resources :posts, defaults: { format: :json } do
    resources :comments
  end
end
