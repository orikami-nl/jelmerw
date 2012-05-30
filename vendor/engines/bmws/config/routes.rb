::Refinery::Application.routes.draw do
  resources :bmws, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :bmws, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
