Rails.application.routes.draw do
  devise_for :users
   get 'welcome/index'
   root 'welcome#index'

   resources :articles do
      resources :comments
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get "/articles", to: "articles#index"



   post "/all", to: "articles#route"
   post '/token' => 'articles#token'
   post '/tokenAuth' => 'articles#tokenAuth'
   
end
