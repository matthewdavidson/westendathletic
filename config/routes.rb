Westendathletic::Application.routes.draw do

  scope '/admin' do
    resource :session, 
      :only => [:new, :create, :destroy]
    resources :users
  end
end
