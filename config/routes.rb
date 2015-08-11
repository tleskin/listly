Rails.application.routes.draw do
  resources :list
  root 'lists#index'
end
