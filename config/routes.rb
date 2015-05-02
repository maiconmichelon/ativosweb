Ativos::Application.routes.draw do

  LOCALES = /en|pt\-BR/
  scope "(:locale)", locale: LOCALES do
    resources :companies do
      resources :fixtures
      resources :providers
      resources :people
      resources :groups
      resources :components
      resources :types
      resources :maintenances
      resources :budgets
      resources :components
    end

    resources :users
    resources :sessions

    get "log_out" => "sessions#destroy", :as => "log_out"
    get "log_in" => "sessions#new", :as => "log_in"
    get "sign_up" => "users#new", :as => "sign_up"
  end

  root 'companies#index'

end
