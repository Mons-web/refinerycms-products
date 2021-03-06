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
        resources :categories, :only => [:index, :update]
      end
      resources :categories, :only => [:create, :show, :index, :update, :destoy, :new, :edit] do
        post :update_positions, :on => :collection
        put :update
      end
    end
  end


end
