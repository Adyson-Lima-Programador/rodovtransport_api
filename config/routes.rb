Rails.application.routes.draw do
  
  # Configuração para rotas usando subdominios
  
  # constraints subdomain: 'v1' do
  #   scope module: 'v1' do
  #     resources :auths, only: [:create]
  #     resources :users
  #     resources :packages
  #   end
  # end
  
  # constraints subdomain: 'v2' do
  #   scope module: 'v2' do
  #     resources :users
  #     resources :packages
  #   end
  # end
  
  namespace :api do
    namespace :v1 do
      resources :auths, only: [:create]
      resources :users
      resources :packages
    end
  end
  
  namespace :api do
    namespace :v2 do
      resources :auths, only: [:create]
      resources :users
      resources :packages
    end
  end
  
end
