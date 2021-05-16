Rails.application.routes.draw do
  resources :books do
    resources :comments
  end
  resources :admin_sessions
  root controller: 'books', action: 'index'
end
