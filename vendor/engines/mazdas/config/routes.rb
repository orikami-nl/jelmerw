::Refinery::Application.routes.draw do
  resources :mazdas, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :mazdas, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
