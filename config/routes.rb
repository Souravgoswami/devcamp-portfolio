Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    member do
      patch :move
    end
  end

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  # get 'pages/home'
  # get 'pages/about'
  # get 'pages/contact'


  get 'rails-items', to: 'portfolios#rails'
  get 'angular-items', to: 'portfolios#angular', as: 'angular'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # resources :blogs

  resources(:blogs) do
    member do
      patch :toggle_status
    end
  end

  root to: 'pages#home'
end
