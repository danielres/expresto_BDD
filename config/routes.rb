Expresto::Application.routes.draw do

  root :to => "home#redirect_to_locale"

  scope "/:locale" do
    root :to => "home#index"
    devise_for  :users
    resources   :users
    resources   :languages
    resources   :expressions
  end

end
