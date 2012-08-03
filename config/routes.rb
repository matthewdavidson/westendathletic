Westendathletic::Application.routes.draw do

	root :to => 'home#index'

  namespace :admin do

  	root :to => 'dashboard#index'

	  resource :session,
    	:only => [:new, :create, :destroy]

    resources :users,
      :except => [:show]

    resources :teams, :competitions

    resources :players, :seasons,
      :except => [:index]

    get 'seasons/:id/teams' => 'seasons#teams', :as => :season_teams
    put 'seasons/:id/teams' => 'seasons#update_teams', :as => :season_teams

	end

end