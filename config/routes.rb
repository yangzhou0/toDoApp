Rails.application.routes.draw do
resources :tasks do
  resources :sub_tasks, only: :new
  member do
    post 'complete'
    post 'undone'
  end
end
resources :sub_tasks, except: :new



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
