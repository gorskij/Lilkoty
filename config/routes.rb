# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      get 'cats/available'
      get 'cats/from_our_breeding'
      get 'litters/index'
      get 'litters/show/:id', to: 'litters#show'
      get 'breeds/index'
      get 'breeds/show/:id', to: 'breeds#show'
      get 'news/index'
      get 'news/relevant', to: 'news#relevant'
    end
  end
  root 'homepage#index'
  get '*path', to: 'homepage#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
