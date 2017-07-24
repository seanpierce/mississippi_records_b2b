Rails.application.routes.draw do

  get '/catalog' , to: 'albums#index'
  
end
