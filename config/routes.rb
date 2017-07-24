Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, :except => [:sign_up]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "pages#home"
  resources :albums
  get '/catalog' , to: 'albums#index'

end
