Rails.application.routes.draw do
  get 'flats/index'
  get 'flats/new'
  get 'flats/create'
  get 'flats/edit'
  get 'flats/show'
  get 'flats/update'
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
