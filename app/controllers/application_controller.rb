class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # on generation of any url it automatically add locale query string part of the url
  # root_path => /?locale=en
  def default_url_options
    { locale: I18n.locale }
  end

  # macro-style methods
  def self.before_snm *args
    
  end
end