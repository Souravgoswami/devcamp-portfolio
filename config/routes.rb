Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  resources :education2s
  resources :educations
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
