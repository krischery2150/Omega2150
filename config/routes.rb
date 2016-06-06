Rails.application.routes.draw do
  resources :capsules

  root  'capsules#index'
end
