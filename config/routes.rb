Rails.application.routes.draw do
  root "companies#index"

  resources :companies, except: [:new] do
    resources :employees, only: [:create, :destroy]
  end
end
