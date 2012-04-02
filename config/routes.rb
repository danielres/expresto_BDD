Expresto::Application.routes.draw do
  resources  :users
  devise_for :users

  authenticated :user do
    root :to => 'home#index'
  end


  root :to => "home#index"

end
