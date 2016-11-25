Rails.application.routes.draw do
  get 'informations/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'

  get  'help'   => 'static_pages#help'
  get  'about'   => 'static_pages#about'
  get  'contact' => 'static_pages#contact'
  get  'search', to: 'search#search'
  get  'advanced_search', to: 'search#advanced_search'
  get  'search_term', to: 'items#search_term'

  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users, only: :show
  resources :advertisements do
    resources :comments do
      put 'upvote', to: 'comments#upvote'
    end
  end
  resources :vehicle_models
  resources :vehicle_brands, only: [:index, :show]
  resources :options

  resources :categories, only: [:index, :show] do
    member do
      get "basic", to: "categories#basic"
      get "additional", to: "categories#additional"
      get "options", to: "categories#options"
    end
  end

  resources :information, only: :index do
    member do
      get 'items', to: 'informations#items'  
    end  
  end
end