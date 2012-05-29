class HomeController < ApplicationController
  def index
    @expressions = Language.find_by_code(params[:locale]).expressions.order('created_at DESC').limit(10)
  end
end
