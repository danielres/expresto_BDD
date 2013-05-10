class ExpressionPresenter < BasePresenter

  def to_html
    row( 'menus'      ){ menus      } +
    row( 'expression' ){ expression } +
    row( 'details'    ){ details    } +
    todo{ row { examples + tags + illustrations } } +
    todo{ row { similar                         } }
  end


  private

    def expression
      render @model
    end

    def menus
      render 'expressions/show/menus',         expression: @model
    end

    def details
      render 'expressions/show/details',       expression: @model
    end

    def examples
      render 'expressions/show/examples',      expression: @model
    end

    def tags
      render 'expressions/show/tags',          expression: @model
    end

    def illustrations
      render 'expressions/show/illustrations', expression: @model
    end

    def similar
      render 'expressions/show/similar',       expression: @model
    end


end