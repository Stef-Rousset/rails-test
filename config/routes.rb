Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :freelancers, only: [:create]
  # resources :requests, only: [:create]
  get '/:token/confirm_email/', to: 'freelancers#confirm_email', as: 'confirm_email'
  get '/:token/reconfirm_satus/', to: 'freelancers#reconfirm_satus', as: 'reconfirm_satus'
  get 'confirmation', to: 'pages#confirmation'
end
