Westendathletic::Application.routes.draw do

	root :to => 'home#index' 
  
  namespace :admin do

  	root :to => 'users#index' 

	  resource :session,
    	:only => [:new, :create, :destroy]

    resources :users

	end

end
