Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :users do
      resources :orders
    end

    resources :orders
    resources :customers
    resources :employees
    resources :items
    root 'sessions#index'
    get '/signin', to: 'sessions#new', as: 'signin'
    post '/signin', to: 'sessions#create'
    delete '/signout', to: 'sessions#destroy'


end
