Qn::Application.routes.draw do
  devise_for :users

  resources :questionnaires do
    resources :questions
  end

  root 'welcome#index'
end
