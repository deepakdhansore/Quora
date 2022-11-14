Rails.application.routes.draw do

 

  get 'posts/index'

  get 'posts/show'

  get 'posts/new'

  resources :users do
    resources :posts do
      resources :comments do
        resources :sub_comments
      end
    end
  end
  root'users#index'

end
