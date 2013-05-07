class HomepagePresenter

  def initialize context
    @context            = context
    @news_title         = @context.t( 'pages.home.news.title', default: 'Latest news'               )
    @comments_title     = @context.t( '.comments',             default: 'Recent comments'           )
    @expressions_title  = @context.t( :recent_expressions_in,
                                      language: @context.t( locale_name, default: locale_name ),
                                      default:  "Recent expressions in #{locale_name}"             ).capitalize
  end

  def to_html
    row do
      column( @expressions_title, 5 ){ expressions } +
      column( @news_title       , 4 ){ news        } +
      column( @comments_title   , 3 ){ comments    }
    end
  end

  private

    def locale           ; @context.params[:locale]               end
    def locale_name      ; Language.find_by_code( locale ).name   end

    def news_items       ; News.published                         end
    def comment_items    ; Comment.recent 10                      end
    def expression_items ; Expression.in( locale ).recent 10      end

    def expressions
      ul class: 'expressions' do
        render( expression_items, state: :list_item ) +
        li { expressions_link }
      end
    end

    def news
      ul class: 'unstyled' do
        render collection: news_items, partial: 'homepage_presenter/news_item'
      end

    end

    def comments
      ul class: %w( unstyled secundary-text )  do
        render comment_items, state: :list_item
      end
    end

    def expressions_link
      @context.link_to  @context.icon(:search)+@context.t(:all_expressions_in, language: @context.t( locale_name )),
                    @context.expressions_path,
                    class: 'btn btn-primary expressions_index',
                    data: { purpose: 'expressions-index' }
    end


    def render *args
      @context.render *args
    end
    def ul *args, &block
      @context.content_tag :ul, yield, *args
    end
    def li *args, &block
      @context.content_tag :li, yield, *args
    end
    def row &block
      @context.content_tag :div, yield, class: 'row'
    end
    def column title, width, &block
      render partial: 'column', locals: { title: title, width: width, content: yield }
    end

end

