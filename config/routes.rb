Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :flats, except: :destroy do

    resources :bookings, only: [:new, :create]


  end

  resources :bookings, except: :destroy do

    resources :reviews


  end

  resources :users, only: [:show, :edit]




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
