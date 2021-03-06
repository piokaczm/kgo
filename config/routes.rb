Rails.application.routes.draw do

  root 'main_pages#home'
  get 'faq' => 'main_pages#help'
  get 'o_nas' => 'main_pages#about'
  get 'kontakt' => 'main_pages#contact'
  get 'zasady_uzytkowania' => 'main_pages#terms'
  get 'rejestracja' => 'users#new'
  get 'szukaj', to: 'searches#search'
  resources :adverts, path: 'ogloszenia'
  resources :users, path: 'uzytkownicy'
  get 'ogloszenia' => 'adverts#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'ogloszenia/:category' => 'adverts#index'
  get ':username' => 'users#show', as: 'user_profile'  
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:edit, :update, :create, :new]
  resources :advert_contacts, only: [:create]
  resources :contact_mes, only: [:create]
  resources :invitations, only: [:new, :create, :index], path: 'zaproszenia'

 
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
