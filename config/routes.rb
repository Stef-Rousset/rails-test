Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :freelancers, only: [:new, :create]
  resources :requests, only: [:new, :create, :update]
  get '/:token/confirm_email/', to: 'freelancers#confirm_email', as: 'confirm_email'
end
