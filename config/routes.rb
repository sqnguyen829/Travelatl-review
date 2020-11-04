Rails.application.routes.draw do
  resources :bloggers
  resources :posts
  resources :destinations
  post 'posts/:id/like', to: 'posts#liked'

  #if using link_to it will ne a get request to update the likes
  # get 'post/:id/like', to: 'posts#liked'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
