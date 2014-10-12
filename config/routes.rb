Rails.application.routes.draw do

	RottenMangoes::Application.routes.draw do

		resources :movies do
			resources :reviews, only: [:new, :create]
			
		end
		resources :users, only: [:new, :create, :show, :index]
		resource :session, only: [:new, :create, :destroy]

		get '/user/:id/wishlist', to: 'users#wishlist', as: :wishlist

		root to: 'movies#index'

		namespace :admin do
			resources :users
			resources :impersonators, only: [:new, :create, :destroy]	
		end
	end


end
