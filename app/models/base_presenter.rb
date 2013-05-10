class BasePresenter

  def initialize context
    @context = context
  end

  private

    def locale                    ;  @context.params[:locale]             end
    def locale_name               ;  Language.find_by_code( locale ).name end
    def t           *args, &block ;  @context.t *args, &block             end

    def render      *args         ;  @context.render *args                end
    def content_tag *args, &block ;  @context.content_tag *args, &block   end

    def ul          *args, &block ;  content_tag :ul,  yield, *args       end
    def li          *args, &block ;  content_tag :li,  yield, *args       end
    def h3          *args, &block ;  content_tag :h3,  yield, *args       end
    def div         *args, &block ;  content_tag :div, yield, *args       end
    def search_icon               ;  @context.icon :search                end

    def row &block
      div( class: 'row' ){ yield }
    end

    def column title, css_class, &block
      div class: css_class do
        h3{ title } + yield
      end
    end
end

