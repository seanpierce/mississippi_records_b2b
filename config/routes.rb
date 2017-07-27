Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, :except => [:sign_up]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "pages#home"

  resources :albums

  resources :orders
  resources :order_items

  resource :cart, only: [:show]

  get '/catalog' , to: 'albums#index'
  get '/catalog/:category' , to: 'albums#index'
  # get '/catalog/mrecs' , to: 'albums#mrecs'
  # get '/catalog/distro' , to: 'albums#distro'
  # get '/catalog/mcass' , to: 'albums#mcass'
  # get '/catalog/dcass' , to: 'albums#dcass'
  # get '/catalog/other' , to: 'albums#other'
  get '/how-to-use-this-site' , to: 'pages#how_to'
  get '/about-us' , to: 'pages#about_us'
  get '/links' , to: 'pages#links'

  get '/add_one', to: 'carts#add_one'
  get '/remove_one', to: 'carts#remove_one'

end
