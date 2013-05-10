class ExpressionPresenter < BasePresenter
  def to_html
    render 'expressions/show', locals: { expression: @model }
  end
end