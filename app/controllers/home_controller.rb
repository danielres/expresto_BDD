class HomeController < ApplicationController
  def index
    @expressions = Expression.in(params[:locale]).recent(10)
  end
end
