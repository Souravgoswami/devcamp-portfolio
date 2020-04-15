Rails.application.routes.draw do
  resources :portfolios
  # get 'pages/home'
  # get 'pages/about'
  # get 'pages/contact'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :education2s
  resources :educations
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
end
