::Refinery::Application.routes.draw do
  resources :audis, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :audis, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
