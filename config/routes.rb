Expresto::Application.routes.draw do

  root :to => "home#redirect_to_locale"
  scope "(:locale)" do
    match 'about' => 'pages#about', :as => :about
    root :to => "home#index"
    devise_for  :users
    resources   :users
    resources   :languages
    resources   :expressions do
      resources   :comments
      resources   :translations
    end
    resources   :news
  end

end
