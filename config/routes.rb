Rails.application.routes.draw do
  	get 'users/show'

  	devise_for :users, :controllers => { :registrations => :registrations }
	root 'static_pages#home'

	get 'help'   => 'static_pages#help'
	get 'about'   => 'static_pages#about'
 	get 'contact' => 'static_pages#contact'

 	resources :users, only: :show
 	resources :categories

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
