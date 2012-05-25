class HomeController < ApplicationController
  def index
    @expressions = Language.find_by_code(params[:locale]).expressions
  end
end
