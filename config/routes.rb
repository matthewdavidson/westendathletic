Westendathletic::Application.routes.draw do

	root :to => 'home#index' 
  
  namespace :admin do

  	root :to => 'users#index' 

	  resource :session,
    	:only => [:new, :create, :destroy]

    resources :users

    resources :teams do

    	resources :players
    	
    end

	end

end
