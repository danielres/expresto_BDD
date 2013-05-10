class ExpressionPresenter < BasePresenter

  def to_html state = :individual
    case state
      when :individual then individual_layout
      when :list_item  then list_item_layout
    end
  end


  private

    def individual_layout
      row( 'menus'      ){ menus      } +
      row( 'expression' ){ individual } +
      row( 'details'    ){ details    } +
      todo{ row { examples + tags + illustrations } } +
      todo{ row { similar                         } }
    end

    def individual
      render 'expressions/show/individual',
              expression: @model,
              avatar:     avatar,
              body:       div( class: 'body' ){ h2{ @model.body } },
              lang:       lang,
              creation_details: creation_details
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

    def avatar
      div( class: 'avatar-small pull-right' ){
        h.link_to h.avatar_image_for( @model.author, size: 48 ), @model.author
      }
    end

    def lang
      @model.language.code
    end

    def creation_details
      content_tag(:small) do
        "#{author} #{ago}".html_safe
      end
    end

    def author
      translation_key = @model.created_by_author == true ? :created_and_added_by : :added_by
      span( class: 'author'){ t( translation_key, author: h.link_to_unless(h.current_page?(h.user_path(a=@model.author)), a, a)).html_safe }
    end

    def ago
      span( class: 'ago'   ){ t(:time_ago, time: h.time_ago_in_words(@model.created_at)) }
    end

end