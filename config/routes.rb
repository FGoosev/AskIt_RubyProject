Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]
  resources :questions do
    resources :ans
  end
  resource :question
  root 'pages#index'
end
