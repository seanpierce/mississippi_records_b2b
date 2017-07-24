Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/catalog' , to: 'albums#index'
  
end
