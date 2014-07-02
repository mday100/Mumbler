Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  resources :blogs, except: :index

  get 'login' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  post 'users/follow/:id' => 'users#follow'
  post 'users/unfollow/:id' => 'users#unfollow'

  root 'home#index'
  # root 'users#index'

end
