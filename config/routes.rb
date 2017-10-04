Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/auth', to: 'authentication#autenthicate_user'
  get '/logout', to: 'authentication#logout_user'
  
  namespace :api do
    namespace :v1 do
      resources :projects
    end
  end
end


