Rails.application.routes.draw do
	root to: 'users#index'	
	resources :users
	get 'users/:id/proccess', to: 'users#proccess'
	match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]
  resources :people
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
