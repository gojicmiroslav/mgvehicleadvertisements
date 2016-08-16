Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  	get 'users/show'

  	devise_for :users, :controllers => { :registrations => :registrations }
	root 'static_pages#home'

	get 'help'   => 'static_pages#help'
	get 'about'   => 'static_pages#about'
 	get 'contact' => 'static_pages#contact'

 	resources :users, only: :show
 	resources :categories
 	resources :advertisements
    resources :vehicle_models
    resources :vehicle_brands
    resources :options

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
