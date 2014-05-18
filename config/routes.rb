Ativos::Application.routes.draw do

  resources :components

  LOCALES = /en|pt\-BR/
  scope "(:locale)", locale: LOCALES do
    resources :fixtures
    resources :providers
    resources :people
    resources :groups
    resources :components
    resources :types
    resources :maintenances
  end

  get "type/new_component" => 'type#new_component', :as => :new_componente

  root 'fixtures#index'

end
