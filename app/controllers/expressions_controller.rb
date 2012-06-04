class ExpressionsController < InheritedResources::Base
  def new
    if signed_in?
      new!
    else
      redirect_to(new_user_session_path, :notice => t(:sign_in_or_sign_up_to_create_expression))
    end
  end
  def create
    @expression = Expression.new(params[:expression])
    @expression.author = current_user
    @expression.language = Language.find_by_code(locale)
    create!
  end
  def index
    @expressions_count = Expression.in(params[:locale]).recent().count
    @expressions = Expression.in(params[:locale]).recent().page(params[:page]).per(10)
  end
end
