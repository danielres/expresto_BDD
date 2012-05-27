class ExpressionsController < InheritedResources::Base

  def create
    @expression = Expression.new(params[:expression])
    @expression.author = current_user
    @expression.language = Language.find_by_code(locale)
    create!
  end

end
