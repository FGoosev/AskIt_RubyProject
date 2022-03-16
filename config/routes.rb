Rails.application.routes.draw do
  devise_for :users
  resources :questions do
    resources :ans
  end
  resource :question
  root 'pages#index'
end
