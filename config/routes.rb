Rails.application.routes.draw do
  devise_for :users

  root "pages#home"
  get '/links', to: "links#index", as: 'links'
  get '/link', to: "links#new"
  post '/link', to: "links#create"
  get '/:shortened', to: "links#redirect"
end
