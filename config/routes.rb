Rails.application.routes.draw do
  post 'signup', to: "users#create"
  post 'user_token', to: 'user_token#create'
  get 'quotes/:tag', to: 'quotes#index'
end
