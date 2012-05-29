class ExpressionsController < InheritedResources::Base
  def new
    if signed_in?
      new!
    else
      redirect_to(new_user_session_path, :notice =>"Please sign in or create an account to add an expression")
    end
  end
  def create
    @expression = Expression.new(params[:expression])
    @expression.author = current_user
    @expression.language = Language.find_by_code(locale)
    create!
  end

end
