Rails.application.routes.draw do

  root 'main#index2'
=begin
  get '/notice' => "main#notice"
  get 'main/test'

  get 'main/fb_load_api'

  get 'upload/facebook' => "main#facebook"

  get 'upload/youtube' => "main#youtube"
  post 'process/facebook' => "main#upload_facebook"
  get 'facebook_uploaded/:id' => "main#facebook_uploaded"

  post 'process/youtube' => "main#upload_youtube"
  get 'youtube_uploaded/:id' => "main#youtube_uploaded"

  get '/login' => "main#login"
  post '/password' => "main#password"

  get '/admin' => "main#admin"

  get 'toggle/:platform/:id' => "main#toggle"
  get 'delete/:platform/:id' => "main#delete"
=end

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
