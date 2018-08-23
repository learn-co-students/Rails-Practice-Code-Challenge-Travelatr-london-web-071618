Rails.application.routes.draw do
  resources :destinations, only: [:index, :show]
  resources :bloggers, only: [:index, :show, :new, :create]
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  post "/posts/:id/like", to: "posts#like", as: "like_post"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
