Rails.application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "pages#index"

  get '/catalog' , to: 'albums#index'

end
