Expresto::Application.routes.draw do

  scope "(:locale)" do
    root :to => "home#index"
    devise_for  :users
    resources   :users
    resources   :languages
    resources   :expressions
  end

end
