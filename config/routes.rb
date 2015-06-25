Ativos::Application.routes.draw do

  scope "(:locale)", locale: /en|pt\-BR|en/ do
    resources :companies do
      resources :fixtures
      resources :providers
      resources :people
      resources :groups
      resources :components
      resources :types
      resources :maintenances do
        collection do
          get 'group_by_period', action: :group_by_period, as: :maintenances_grouped_by_period
        end
      end
      resources :budgets
      resources :components
      resources :purchase_requests
      resources :maintenance_requests

      member do
        get 'permissions', as: :permissions
        
        put 'define_permission/:user_id', action: :define_permission, as: :define_permission 
        put 'remove_permission/:user_id', action: :remove_permission, as: :remove_permission
        put 'define_admin_permission/:user_id', action: :define_admin_permission, as: :define_admin_permission
        
        put 'approve_request/:request_id', to: 'requests#approve_request', as: :approve_request 
        put 'reprove_request/:request_id', to: 'requests#reprove_request', as: :reprove_request
        put 'back_to_pending/:request_id', to: 'requests#back_to_pending', as: :back_to_pending
      end
    end

    devise_for :users
    get 'users/:id' => 'users#show', as: :user
  end

  root 'companies#index'

end
