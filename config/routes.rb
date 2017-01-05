Rails.application.routes.draw do
  root 'weather#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :weather, only: [] do
      collection do
        get :current, :forecast
      end
    end
  end
end
