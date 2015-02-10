class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  private

  def user_logged_in?
    !!current_user
  end
  helper_method :user_logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def access_denied
    flash[:danger] = "Access forbidden"
    redirect_to root_path
  end

  def require_logged_in
    access_denied unless user_logged_in?
  end
 
  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  # Get locale from top-level domain or return nil if such locale is not available
  # You have to put something like:
  #   127.0.0.1 application.com
  #   127.0.0.1 application.it
  #   127.0.0.1 application.pl
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
