::Refinery::Application.routes.draw do
  resources :accessoires, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :accessoires, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
