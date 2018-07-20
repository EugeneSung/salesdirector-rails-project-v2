Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :users do
      resources :orders
    end
    post 'users/:id/disable' => 'users#disable', as: :disable
    post 'users/:id/enable' => 'users#enable', as: :enable
    resources :orders
    resources :customers
    resources :employees
    resources :items
    root 'sessions#index'
    get '/signin', to: 'sessions#new', as: 'signin'
    post '/signin', to: 'sessions#create'
    delete 'signout', to: 'sessions#destroy', as: 'signout'
    get 'auth/:provider/callback', to: 'sessions#om_create'
    get 'auth/failure', to: redirect('/')


    namespace :admin do
     resources :preferences
   end
end
