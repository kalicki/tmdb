Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'movies#index'
 
  get 'movies/pagination/', to: 'movies#pagination'
  get 'movies/:id', to: 'movies#show'
  get 'search', to: 'movies#search'
  
  get '*path', to: 'movies#index'
end
