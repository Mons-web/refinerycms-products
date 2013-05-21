Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :products do
    resources :products, :path => '', :only => [:index, :show]
  end

  namespace :categories do
    resources :categories, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :products, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :products, :except => :show do
        post   :update_positions, :on => :collection
        #delete :destroy_images, :on => :member
        resources :product_images
      end
    end
  end

end
