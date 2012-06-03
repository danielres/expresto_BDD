class HomeController < ApplicationController
  def index
    @expressions = Expression.in(params[:locale]).recent(10)
  end
  def redirect_to_locale
    redirect_to "/#{locale}"
  end
end
