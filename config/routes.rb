Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/new'

  get 'comments/show'

  get 'attendings/index'

  get 'attendings/new'

  get 'attendings/show'

  get 'attendings/edit'

  get '/events'=>'events#index'

  get 'events/new'
  get 'events/:id/edit'=>'events#new'
  post 'events/:id/update'=>'events#update'
  get 'events/:id'=>'events#edit'

  get 'events/show'

  get '/'=>'users#index'
  post 'register'=>'users#register'
  # post '/logout'=>'users#logout'
  get '/logout'=>'users#logout'
  post '/login'=>'users#login'
  delete '/events/:id'  => 'events#destroy'
  get 'users/show'

  get 'users/new'

  get 'user/:id'=>'users#edit'
  post 'events/create'=>'events#create'
  post 'users/:id/edit'=>'users#update'
  post '/attendings' => 'attendings#create'
  post '/comments/:id'=>'comments#create'
  delete '/attendings/:id'=>'attendings#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
