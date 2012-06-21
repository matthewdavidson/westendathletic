Westendathletic::Application.routes.draw do

	root :to => 'admin/sessions#new' 
  
  namespace :admin do

  	root :to => 'users#index' 

	  resource :session,
    	:only => [:new, :create, :destroy]

    resources :users

	end

end
