Rails.application.routes.draw do
  resources :questions do
    resources :ans
  end
  resource :question
  root 'pages#index'
end
