Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "plans#index"
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
  get 'users/my_Idea/:id' => 'users#my_plan', as: 'my_plan'
  get 'users/my_Ability/:id' => 'users#my_ability', as: 'my_ability'
  get 'users/my_Product/:id' => 'users#my_product', as: 'my_product'
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :plans, only: [:index, :show, :edit, :update]
    resources :abilities, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :show, :edit, :update]
    resources :comments, only: [:index, :show, :edit, :update]
  end

  resources :users, only: [:index, :show, :edit, :update]
  resources :plans
  resources :abilities
  resources :products
  resources :comments, only: [:new, :create, :edit, :update, :destroy]
  resources :likes, only: [:create, :destroy]
end
