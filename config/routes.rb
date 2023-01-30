Rails.application.routes.draw do
  get '/users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/:id', to: 'posts#show'

  resources :users, only: %i[index show]
  resources :posts, only: %i[index show]
end
