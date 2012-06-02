Westendathletic::Application.routes.draw do
  
  scope '/admin' do
    resources :users
  end
end
