Qn::Application.routes.draw do
  devise_for :users

  resources :questionnaires, only: [:index]

  root 'welcome#index'
end
