Rails.application.routes.draw do
  devise_for :staffs, only: [:sessions], controllers: { sessions: 'staffs/sessions' }
  devise_for :users, only: [:sessions], controllers: { sessions: 'users/sessions' }

  namespace :staffs, path: 'manage', as: 'manage' do
    resources :dashboard, only: [:index]
    resources :staffs, except: [:destroy]

    root 'dashboard#index'
  end

  root to: redirect('manage')
end
