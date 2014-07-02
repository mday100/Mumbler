Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  resources :blogs, except: :index

  get 'login' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  post 'follow/:id' => 'users#follow'
  post 'unfollow/:id' => 'users#unfollow'

  root 'users#index'

end
