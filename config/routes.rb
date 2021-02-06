Rails.application.routes.draw do
  root to: "static#home"

  resource :account, only: [:show] do
  end

  resources :sessions, only: [], path: "account" do
    collection do
      get :login
      get :logout
      delete :logout
      get :register
    end
  end

  resources :qr_codes, path: :q, param: :code
  resources :conversations, path: :c, param: :code
end
