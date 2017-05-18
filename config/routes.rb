Rails.application.routes.draw do
  resources :listings

  root to: "pages#index"

  # devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }

  resources :users, only: [:show]

  resources :photos, only: [:create, :destroy] do
    collection do
      get :list
    end
  end

  get 'manage-listing/:id/basics' => 'listings#basics', as: 'manage-listing_basics'
  get 'manage-listing/:id/description' => 'listings#description', as: 'manage-listing_description'
  get 'manage-listing/:id/address' => 'listings#address', as: 'manage-listing_address'
  get 'manage-listing/:id/price' => 'listings#price', as: 'manage-listing_price'
  get 'manage-listing/:id/photos' => 'listings#photos', as: 'manage-listing_photos'
  get 'manage-listing/:id/calendar' => 'listings#calendar', as: 'manage-listing_calendar'
  get 'manage-listing/:id/bankaccount' => 'listings#bankaccount', as: 'manage-listing_bankaccount'
  get 'manage-listing/:id/publish' => 'listings#publish', as: 'manage-listing_publish'

end
