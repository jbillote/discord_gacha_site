Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#index'
  namespace :api do
    namespace :v1 do
      get 'user/:id', to: 'user#cards'
      get 'card/:set/:rarity/:id', to: 'card#show'

      get 'search/user/:username', to: 'user#search'

      get 'set/:set', to: 'set#show'
    end
  end
end
