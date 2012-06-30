Arkham::Application.routes.draw do

  root to: 'expansions#index'
  
  resources :encounters, :locations, :expansions

end