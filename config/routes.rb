Expresto::Application.routes.draw do

  root :to => "home#index", :locale => 'en' # set the default locale here (ex: 'en')

  scope "/:locale" do
    root :to => "home#index"
    resources :languages
    resources :expressions
    resources  :users
  end

  devise_for :users

  authenticated :user do
    root :to => 'home#index'
  end



end
