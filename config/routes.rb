Vzs::Application.routes.draw do

  match 'pages/:id-:slug' => 'pages#show', :as => :page_seo, :via => :get
  

  resources :pages

  resources :articles do
    resources :comments
    resources :attachments
  end

  resources :galleries do
    resources :photos
  end

  resources :articles
  resources :galleries

  get "user_sessions/new"

  resources :users do
    member do
      get :stats
    end
  end

  resources :user_sessions
  match 'register' => 'Users#new', :as => :register

  resources :shows do
    member do
      post :join
      put :kick
      put :archive
      put :unarchive
    end

    collection do
      get :archived
      get :feed
    end
  end

  match 'stats' => 'statistics#stats', :as => 'stats'

  # vypis osob
  match 'clenove' => 'Users#index', :as => :members

  # authlogic veci
  match 'login' => 'UserSessions#new', :as => :login
  match 'logout' => 'UserSessions#destroy', :as => :logout

  root :to => 'Application#welcome'

  match '/*a', :to => 'Application#welcome'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
