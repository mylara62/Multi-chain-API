Rails.application.routes.draw do
  root 'users#register'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]

      resources :coins, only: [:create, :index] do 
      	post :coin_send, on: :collection
      	post :history, on: :collection
      	post :additional, on: :collection
      end
      
      resource :balances, only: :create
    end
  end

  resource :users, only: [:create,:destroy] do
    get :register,on: :collection
    get :admin,on: :collection
    get :access_allow,on: :collection
  end

  resource :coins do
    get :api_doc, on: :collection
    get :coins_list, on: :collection
    get :generate_coin,on: :collection
    post :coin_generate,on: :collection
    get :coin_show,on: :collection
    get :transactions,on: :collection
    get :send_coin,on: :collection
    post :coin_send,on: :collection
    get :coin_transaction,on: :collection
    get :balances,on: :collection    
    get :balance_check, on: :collection
    get :search,on: :collection
    get :get_search,on: :collection
  end
end
