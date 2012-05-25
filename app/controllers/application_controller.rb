class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_available_languages

private

  def load_available_languages
    @available_languages = Language.all
  end

end
