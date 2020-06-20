Rails.application.routes.draw do
  # resources :topics, only: [:index, :show]
  get 'topics', to: 'topics#index'
  get 'topics/:id', to: 'topics#show', as: 'topic_show'

  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    member do
      patch :move
    end

    collection do
      patch :remove_session_source
    end
  end

  get 'tech-news', to: 'pages#tech_news'
  get 'portfolio/:id/edit', to: 'portfolios#edit', as: 'portfolio_edit'
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

  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end
