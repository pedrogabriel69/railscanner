Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  resources :tickets, except: [:edit, :update]
  resource :search, only: [:show, :create]

  namespace :admin do
    resources :trains do
      resources :wagons, shallow: true
    end

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_arrive_departure, on: :member
    end

    get 'admin/index'
    resources :tickets
    resources :routes
    resources :economy, controller: 'wagons', type: 'Economy'
    resources :comfort, controller: 'wagons', type: 'Comfort'
    resources :super_economy, controller: 'wagons', type: 'SuperEconomy'
    resources :lux, controller: 'wagons', type: 'Lux'
  end

  root 'searches#show'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
