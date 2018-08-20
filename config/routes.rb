Rails.application.routes.draw do
  put '/posts/:id/like', to: 'posts#like', as: 'like'
  resources :bloggers
  resources :destinations
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
