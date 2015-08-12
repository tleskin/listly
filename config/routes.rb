Rails.application.routes.draw do
  root 'lists#index'
  resources :lists do
    resources :tasks do
      delete '/remove', to: 'tasks#remove_image'
    end
  end

  post '/change', to: 'tasks#change_status'

end
