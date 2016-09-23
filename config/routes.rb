Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sites#home"
  devise_for :users
  get '/users/:id', to: 'users#show'
  post '/search', to: 'sites#search'
  resources :projects
end
