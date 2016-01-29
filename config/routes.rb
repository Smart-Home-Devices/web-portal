Rails.application.routes.draw do
  resources :sensors
   devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  resources :users, only: [:show]
  get 'users/:id/change_admin' => 'users#change_admin'
  get 'users/:id/permission' => 'users#permission', as: :user_permission
  resources :families
  get '/devices/turn_on' => 'devices#turn_on'
  get '/devices/turn_off' => 'devices#turn_off'
  get '/devices/turn_on_all' => 'devices#turn_on_all'
  get '/devices/turn_off_all' => 'devices#turn_off_all'
  get '/devices/state_change' => 'devices#state_change'
  resources :devices
  get '/remote' => 'remote#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'devices#index'
  
  get 'pages/about'

  get 'pages/contact'

  get 'pages/welcome'
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
