Rails.application.routes.draw do
  devise_for :users

  root "pages#home"
  get '/links', to: "links#index"
end
