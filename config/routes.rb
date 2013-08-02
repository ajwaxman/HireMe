HireCrm::Application.routes.draw do

  resources :records
  resources :interviews

  #################
  # Custom Routes #
  #################

  root :to => 'sessions#new'

  get 'login',     to: 'sessions#new',     as: 'login'
  post 'login',    to: 'sessions#login'
  get 'signup',    to: 'sessions#signup',  as: 'signup'
  post 'signup',   to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'dashboard', to: 'users#dashboard'

  post 'jobs/import_job' => 'jobs#import_job'
  get 'jobs/import_result' => 'jobs#import_result'

  #############################
  # Buttons for State Machine #
  #############################

  get 'jobs/:id/like_company' => 'states#like_company', as: 'like_company'
  post 'jobs/:id/like_company' => 'states#like_company'

  get 'jobs/:id/unlike_company' => 'states#unlike_company', as: 'unlike_company'
  post 'jobs/:id/unlike_company' => 'states#unlike_company'

  get 'interviews/:id/rel_like_company' => 'states#rel_like_company', as: 'rel_like_company'
  post 'interviews/:id/rel_like_company' => 'states#rel_like_company'

  get 'interviews/:id/rel_unlike_company' => 'states#rel_unlike_company', as: 'rel_unlike_company'
  post 'interviews/:id/rel_unlike_company' => 'states#rel_unlike_company'

  get 'interviews/:id/rel_company_declined' => 'states#rel_company_declined'
  post 'interviews/:id/rel_company_declined' => 'states#rel_company_declined'

  get 'interviews/:id/rel_user_declined' => 'states#rel_user_declined'
  post 'interviews/:id/rel_user_declined' => 'states#rel_user_declined'

  get 'interviews/:id/rel_offer_received' => 'states#rel_offer_received'
  post 'interviews/:id/rel_offer_received' => 'states#rel_offer_received'

  get 'interviews/:id/accept_offer' => 'states#accept_offer'
  post 'interviews/:id/accept_offer' => 'states#accept_offer'

  get 'interviews/:id/reject_offer' => 'states#reject_offer'
  post 'interviews/:id/reject_offer' => 'states#reject_offer'  


  ##################
  # RESTful Routes #
  ##################

  resources :companies do 
    resources :jobs,
      :controller => 'companies/jobs',
      :only => [:new]
  end
  
  resources :jobs do 
    resources :interviews,
      :controller => 'jobs/interviews',
      :only => [:new]
  end

  resources :users do 
    resources :interviews,
      :controller => 'users/interviews',
      :only => [:new]
  end

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  
end
