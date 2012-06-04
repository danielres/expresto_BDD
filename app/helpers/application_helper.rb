module ApplicationHelper
  def todo( wrapper=:div, &block )
    content_tag(wrapper, capture(&block), :class => :todo) if ( Rails.env == 'development' )
  end
end
