class HomeController < ApplicationController
  def index
    @expressions = Expression.all
  end
end
