class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= Dibber.find(session[:dibber_id]) if session[:dibber_id]
  end

  def logged_in?
    !!current_user
  end
end
