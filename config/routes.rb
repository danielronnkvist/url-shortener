Rails.application.routes.draw do
  devise_for :users

  get '/links', to: "links#index"
end
