Rails.application.routes.draw do
  devise_for :users

  root "pages#home"
  get '/links', to: "links#index", as: 'links'
  get '/links/new', to: "links#new", as: 'new_link'
  post '/links', to: "links#create"
  delete '/links/:id', to: "links#destroy", as: 'delete_link'
  get '/:shortened', to: "links#redirect"
end
