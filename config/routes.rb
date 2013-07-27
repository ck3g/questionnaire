Qn::Application.routes.draw do
  devise_for :users

  resources :questionnaires

  root 'welcome#index'
end
