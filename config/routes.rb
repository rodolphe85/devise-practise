Rails.application.routes.draw do

  devise_for :users
  resources :questions
  resources :users

  root to: 'questions#index'
  end
