Rails.application.routes.draw do
  devise_for :users

  get '/dashboard', to: 'dashboard#index'
  devise_scope :user do
    authenticated :user do
      root to: 'dashboard#index', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end
end
