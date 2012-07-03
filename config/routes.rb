Arkham::Application.routes.draw do

  root to: 'encounters#index'
  
  resources :encounters, :locations, :expansions

end