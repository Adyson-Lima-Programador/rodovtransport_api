Rails.application.routes.draw do
  
  constraints subdomain: 'v1' do
    scope module: 'v1' do
      resources :users
      resources :packages
    end
  end
  
  constraints subdomain: 'v2' do
    scope module: 'v2' do
      resources :users
      resources :packages
    end
  end
  
end
