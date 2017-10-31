Rails.application.routes.draw do
  get 'computation/new'

  post 'computation/index'

  root 'computation#new' # shortcut for the above

  resources :templates

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
