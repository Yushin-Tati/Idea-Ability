Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "/about" => "homes#about"
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
  get 'users/follow_list/:user_id' => 'users#follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list'
  get 'users/my_Idea/:user_id' => 'users#my_plan', as: 'my_plan'
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :plans

end
