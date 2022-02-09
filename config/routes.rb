Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :questions do
    resources :ans
  end
  resource :question
  root 'pages#index'
end
