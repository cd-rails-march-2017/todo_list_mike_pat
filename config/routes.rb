Rails.application.routes.draw do
  root 'tasks#index'

  get '/tasks/new'

  post '/tasks' => 'tasks#create'

  patch '/tasks/:id' => 'tasks#update'

  get '/login' => 'users#index'

  post '/users' => 'users#create'

  post '/logout' => 'users#logout'

  post '/show_hide' => 'tasks#show_hide'
end
