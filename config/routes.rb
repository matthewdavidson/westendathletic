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

	end

end