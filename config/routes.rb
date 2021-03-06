Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/auth', to: 'authentication#autenthicate_user'
  get '/logout', to: 'authentication#logout_user'
  
  namespace :api do
    namespace :v1 do
      resources :users
      resources :employees
      resources :containers
      resources :customers
      resources :products
      resources :drivers
      resources :imports do
        resources :dispatchs
      end
      resources :import_products

      resources :dispatchs
    end
  end
end


