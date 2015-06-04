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

    devise_for :users
  end

  root 'companies#index'

end
