class HomeController < ApplicationController

  rescue_from RuntimeError, :with => :rescue_from_unavailable_locale #FIXME: hmmm... not sure it's the best way to handle this

  def index
    @expressions = Expression.in(params[:locale]).recent(10)
    @news = News.published
  end

  def redirect_to_locale
    redirect_to "/#{locale}"
  end

private

  def rescue_from_unavailable_locale
    redirect_to "/#{Language.first.code}", :notice => "Sorry, but the locale \"#{locale.upcase}\" is not implemented yet, so you have been redirected here."
  end

end
