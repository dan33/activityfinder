ActivityFinder::Application.routes.draw do
	devise_for :users

	root :to => "home#index"

	get '/users/profile' => "users#show"
	post '/search/' => "activities#locate"

  resources :categories, :only => [:show, :index]
	resources :users, :only => [:show]
  resources :activities
  resources :comments
  resources :memberships



end