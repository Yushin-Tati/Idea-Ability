Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "/about" => "homes#about"
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
  get 'users/my_Idea/:id' => 'users#my_plan', as: 'my_plan'
  get 'users/my_Ability/:id' => 'users#my_ability', as: 'my_ability'
  get 'users/my_Product/:id' => 'users#my_product', as: 'my_product'
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :plans
  resources :abilities
  resources :products
  #resources :comments, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  

end
