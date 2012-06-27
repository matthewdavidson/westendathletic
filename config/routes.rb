Westendathletic::Application.routes.draw do

	root :to => 'home#index' 
  
  namespace :admin do

  	root :to => 'users#index' 

	  resource :session,
    	:only => [:new, :create, :destroy]

    resources :users

    resources :teams do

    	resources :players, :except => [:index]
    	
    end

    resources :competitions do

      resources :seasons, :except => [:index]

    end

	end

end