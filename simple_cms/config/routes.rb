Rails.application.routes.draw do
  # get 'pages/index'
  # get 'pages/show'
  # get 'pages/new'
  # get 'pages/edit'
  # get 'pages/delete'

  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  get ':controller(/:action(/:id))'
  get 'demo/index'
  get 'demo/about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
