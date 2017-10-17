Rails.application.routes.draw do
  resources :people
	root to: 'users#index'	
	resources :users
	get 'users/:id/proccess', to: 'users#proccess'
	get 'users/:id/queue', to: 'users#queue'
	match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]
	resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
