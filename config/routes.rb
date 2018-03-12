Rails.application.routes.draw do
resources :tasks do
  member do
    post 'complete'
    post 'undone'
  end
end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
