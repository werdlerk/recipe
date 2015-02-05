class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
end
