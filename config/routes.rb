Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'
  resources :parking_lots, only: [:new, :create, :update] do
    member do
      get :leave_parking_lot
      post :leave_parking_lot
    end
    collection do
      get :new_car_to_park
    end
  end
  resources :parking_logs
end
