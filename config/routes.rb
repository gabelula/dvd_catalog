DvdCatalog::Application.routes.draw do

  root :to => "movies#index"

  resources :movies do
    resources :actors
    resources :directors
#    get :auto_complete_search, :on => :collection
  end

  resources :actors
  resources :directors
end
