DvdCatalog::Application.routes.draw do

  root :to => "discs#index"

  resources :discs do
    resources :actors
    resources :directors
  end

  resources :actors
  resources :directors
end
