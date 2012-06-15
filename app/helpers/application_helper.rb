module ApplicationHelper
  def todo( wrapper=:div, attributes={}, &block )
    attributes[:class] = attributes[:class].to_s + ' todo'
    content_tag(wrapper, capture(&block), attributes) if ( Rails.env == 'development' )
  end
  def advanced_format(*args)
    simple_format(*args).gsub(/@(\d+)/) { |s| u=User.find(s[1..-1].to_i); link_to u, u }.html_safe
  end
end
