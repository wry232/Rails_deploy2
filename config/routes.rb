Rails.application.routes.draw do
  get '/songs'=>'songs#index'

  get 'songs/show'

  get '/main'=>'users#index'

  get 'users/show'

  get 'users/new'
  post 'register'=>'users#register'
  post 'login'=>'users#login'
  get  '/logout' => 'users#logout'
  post 'songs'=>'songs#create'
  get 'songs/add/:id'=>'songs#add'
  get 'songs/:id'=>'songs#show'
  get 'users/:id'=>'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
