Rails.application.routes.draw do
  resources :contacts do
    resources :messages
  end
  resources :messages

  get :home, to: 'home#index', as: :home
  root to: 'home#index'
end
