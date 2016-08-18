Rails.application.routes.draw do
    get 'categories/index'

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    root 'static_pages#home'
    get  'help'   => 'static_pages#help'
    get  'about'   => 'static_pages#about'
    get  'contact' => 'static_pages#contact'

    devise_for :users, :controllers => { :registrations => :registrations }
    resources :users, only: :show
    resources :advertisements
    resources :vehicle_models
    resources :vehicle_brands
    resources :options

    resources :categories, only: :index do
        member do
        get "options", to: "categories#options"
        end
    end

end

