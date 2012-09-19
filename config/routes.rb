DvdCatalog::Application.routes.draw do

  root :to => "movies#index"

  resources :movies do
    resources :actors
    resources :directors
  end

  resources :actors
  resources :directors
end
