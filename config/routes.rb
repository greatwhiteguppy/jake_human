Rails.application.routes.draw do
  root 'users#index'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show'

  get 'bright_ideas' => 'bright_ideas#new'
  get 'bright_ideas/:id' => 'bright_ideas#show'
  post 'bright_ideas' => 'bright_ideas#create'
  delete 'bright_ideas/:id' => 'bright_ideas#destroy'

  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  post 'likes' => 'likes#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
