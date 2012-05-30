::Refinery::Application.routes.draw do
  resources :volvos, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :volvos, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
