Rails.application.routes.draw do

  resources :inne, controller: 'adverts', type: "Inne", only: [:index]
  resources :kierownice, controller: 'adverts', type: "Kierownica", only: [:index]
  resources :kola, controller: 'adverts', type: "Kolo", only: [:index]
  resources :korby, controller: 'adverts', type: "Korba", only: [:index]
  resources :mostki, controller: 'adverts', type: "Mostek", only: [:index]
  resources :ramy, controller: 'adverts', type: "Rama", only: [:index]
  resources :rowery, controller: 'adverts', type: "Rower", only: [:index]
  resources :siodla, controller: 'adverts', type: "Siodlo", only: [:index]
  resources :sztyce, controller: 'adverts', type: "Sztyca", only: [:index]
  resources :widelce, controller: 'adverts', type: "Widelec", only: [:index]
  
  root 'main_pages#home'
  get 'faq' => 'main_pages#help'
  get 'o_nas' => 'main_pages#about'
  get 'kontakt' => 'main_pages#contact'
  get 'zasady_uzytkowania' => 'main_pages#terms'
  get 'rejestracja' => 'users#new'  
  resources :users, :adverts
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'  
  get ':username' => 'users#show', as: 'user_profile'  
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:edit, :update, :create, :new]

 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
