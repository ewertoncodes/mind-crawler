Rails.application.routes.draw do
  get 'quotes/:tag', to: 'quotes#index'
end
