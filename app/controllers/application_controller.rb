class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_available_languages

private

  def load_available_languages
    @available_languages = Language.all
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

end
