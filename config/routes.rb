Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, :controllers => {registrations: 'registrations'}
  root to: "home#index"

  resources :secret_codes do
  	collection do
  		post :genrate_codes
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
