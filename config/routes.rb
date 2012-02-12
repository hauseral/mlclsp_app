MlclspApp::Application.routes.draw do
  resources :resource_periods

  resources :periods

  resources :follower_products

  resources :followers

  #get "pages/about"

  #get "dependencies/index"

  #get "products/index"

  #get "problem_solutions/index"
  match 'problem_solutions/optimize', :to => 'problem_solutions#optimize'
  resources :demands

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :problem_solutions
  resources :products
  resources :resources

  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
 # match 'demands/show',  :to => 'demands#show'
#  match '/new', :to => 'demands#new'
  match 'problem_solutions/read_and_show_ofv', :to => 'problem_solutions#read_and_show_ofv'
  match 'problem_solutions/read_production_quantities', :to => 'problem_solutions#read_production_quantities'
  match 'problem_solutions/show_production_quantities', :to => 'problem_solutions#show_production_quantities'
  match 'problem_solutions/show_inventory_quantities', :to => 'problem_solutions#show_inventory_quantities'
  match 'problem_solutions/dele_production_quantities', :to => 'problem_solutions#delete_production_quantities'
  root :to => 'pages#home'
  match '/about',   :to => 'pages#about'






  #get "pages/home"

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
