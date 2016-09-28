Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sites#home"
  devise_for :users
  resource :users do 
  	resources :projects	
  	post "/projects/:id/add" => "projects#add_item"
  end
  get '/users/:id', to: 'users#show'
  get '/search', to: 'sites#search'
  get '/sort_by', to: 'sites#sort_by'
  get '/project/:id/products/:product_id', to: 'products#destroy', as: 'destroy_item'
  
end
