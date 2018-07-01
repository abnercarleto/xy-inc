Rails.application.routes.draw do
  resources :point_of_interests do
    collection do
      get :closeness
    end
  end
end
