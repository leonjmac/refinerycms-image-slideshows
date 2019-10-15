Refinery::Core::Engine.routes.draw do
  
  # Frontend routes
  namespace :image_slideshows do
    resources :image_slides, :path => '', :only => [:index, :show]
  end

  # Backend routes
  namespace :admin, :path => Refinery::Core.backend_route do
    resources :image_slideshows do
      resources :image_slides, :except => :show do
        get :insert, :on => :collection
      end
    end
  end
end

# Refinery::Core::Engine.routes.append do

#   # Admin routes
#   namespace :image_slideshows, :path => '' do
#     namespace :admin, :path => Refinery::Core.backend_route do
#       resources :image_slideshows do
#         resources :image_slides, :except => :show do
#           collection do
#             post :update_positions
#           end
#         end
#         collection do
#           post :update_positions
#         end
#       end
#     end
#   end

# end
