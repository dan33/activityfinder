ActivityFinder::Application.routes.draw do
	devise_for :users

	root :to => "home#index"

	get '/users/profile' => "users#show"
	post '/search/' => "activities#locate"

  resources :categories, :only => [:show, :index]
	resources :users, :only => [:show]
  resources :activities, :only => [:new, :create, :index, :show]
  resources :comments
  resources :memberships



end